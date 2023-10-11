import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/libraries/globals.dart' as globals;
import 'package:mechar/screens/changing_profile_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String userName = "";
  String userEmail = "";
  String userLocation = "";
  String userPhoneNumber = "";
  Color containerColor = Colors.red;
  bool _isHover = false;

  void getCurrentUserData() async {
    final auth = FirebaseAuth.instance;
    //shorten the _auth.currentUser! syntax
    globals.userData = auth.currentUser!;
    //get hold of the users collection
    final users = FirebaseFirestore.instance.collection('users');
    //get hold of the documents which is the user.uid and get the data
    final userData = await users.doc(globals.userData.uid).get();
    setState(
      () {
        userName = userData.data()![
            'username']; //reach the username in the firebase firestore and set it to the userName
        userEmail = globals.userData.email; //set the user email
        userLocation = userData.data()!['address location'];
        userPhoneNumber = userData.data()!['phone number'];
      },
    );
    userData.data()!.clear();
  }

  void deleteAccount() async {
    final auth = FirebaseAuth.instance;
    //shorten the _auth.currentUser! syntax
    globals.userData = auth.currentUser!;
    //get hold of the users collection
    final users = FirebaseFirestore.instance.collection('users');
    Navigator.pop(context);
    await users.doc(globals.userData.uid).delete();
    auth.currentUser!.delete();
    await auth.signOut();
    //get hold of the documents which is the user.uid and delete the data
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    void changeColor() {
      if (_isHover == false) {
        setState(() {
          _isHover = true;
          containerColor = const Color(0xff8f0000);
        });
      } else {
        setState(() {
          _isHover = false;
          containerColor = Colors.red.withOpacity(1);
        });
      }
    }

    getCurrentUserData();
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Profile',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              color: const Color(0xff004380),
              width: 150,
              height: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            EditProfileCategories(
              title: 'Name',
              content: userName,
              description:
                  'Use real name to make verification easier.\nThis name will be shown in some pages.',
              keyword: 'username',
              canEdit: true,
            ),
            EditProfileCategories(
              title: 'Email',
              content: userEmail,
              description: '',
              keyword: '',
              canEdit: false,
            ),
            EditProfileCategories(
              title: 'Location',
              content: userLocation,
              description:
                  'Describe your location as detail as possible.\nDO NOT USE FALSE ADDRESS',
              keyword: 'address location',
              canEdit: true,
            ),
            EditProfileCategories(
              title: 'Phone',
              content: userPhoneNumber,
              description:
                  'Please make sure to use a valid phone number.\nThis will make easier contacting',
              keyword: 'phone number',
              canEdit: true,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "WARNING!",
                  desc:
                      "Proceeding will delete all of your user's information. Recovery not possible",
                  buttons: [
                    DialogButton(
                      onPressed: () {
                        deleteAccount();
                        Navigator.pop(context);
                      },
                      color: const Color.fromRGBO(0, 179, 134, 1.0),
                      child: const Text(
                        "PROCEED",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ).show();
              },
              child: Listener(
                onPointerDown: (event) => changeColor(),
                onPointerUp: (event) => changeColor(),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: containerColor),
                  child: Center(
                    child: Text(
                      'Delete Account',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileCategories extends StatelessWidget {
  const EditProfileCategories(
      {super.key,
      required this.description,
      required this.title,
      required this.content,
      required this.keyword,
      required this.canEdit});

  final String description;
  final String title;
  final String keyword;
  final String content;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    void goToChangingProfileScreen(
        String content, String description, String title, String keyword) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ChangingProfileScreen(
              content: content,
              description: description,
              title: title,
              keyword: keyword,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          canEdit
              ? goToChangingProfileScreen(content, description, title, keyword)
              : () {};
        },
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Expanded(
              flex: 7,
              child: Text(
                content,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 1,
              child: canEdit
                  ? const Icon(
                      FontAwesomeIcons.angleRight,
                      size: 20,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
