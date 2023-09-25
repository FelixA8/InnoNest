import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/libraries/globals.dart' as globals;

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  String userName = "";
  String? userEmail;

  Future<void> _signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  void getCurrentUserData() async {
    final _auth = FirebaseAuth.instance;
    //shorten the _auth.currentUser! syntax
    globals.userData = _auth.currentUser!;
    //get hold of the users collection
    final users = FirebaseFirestore.instance.collection('users');
    //get hold of the documents which is the user.uid and get the data
    final userData = await users.doc(globals.userData.uid).get();
    setState(
      () {
        userName = userData.data()![
            'username']; //reach the username in the firebase firestore and set it to the userName
        userEmail = globals.userData.email; //set the user email
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: CircleAvatar(
                backgroundColor: Color(0xff0085FF),
                radius: 102,
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/profile_images/bird_image.jpg'),
                  radius: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                userName,
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AccountSettingsCategories(
              description: 'Set your account',
              title: 'Edit Profile',
              icon: FontAwesomeIcons.user,
              action: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            AccountSettingsCategories(
              description: 'View your previous buying',
              title: 'Purchase History',
              icon: FontAwesomeIcons.creditCard,
              action: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            AccountSettingsCategories(
              description: 'See your coupons and discounts',
              title: 'My Rewards',
              icon: FontAwesomeIcons.award,
              action: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            AccountSettingsCategories(
              description: 'Exit your current account',
              title: 'Log Out',
              icon: FontAwesomeIcons.doorOpen,
              action: _signOut,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSettingsCategories extends StatelessWidget {
  const AccountSettingsCategories({
    required this.description,
    required this.icon,
    required this.title,
    required this.action,
    super.key,
  });
  final String title;
  final String description;
  final IconData icon;
  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff0085FF),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xff0085FF), // Background color
//             ),
//             onPressed: () {
//               _signOut();
//             },
//             child: Text(
//               'Logout',
//               style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
//             )),
