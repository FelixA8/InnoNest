import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/libraries/globals.dart' as globals;

class ChangingProfileScreen extends StatefulWidget {
  const ChangingProfileScreen(
      {super.key,
      required this.keyword,
      required this.title,
      required this.content,
      required this.description});
  final String keyword;
  final String title;
  final String description;
  final String content;

  @override
  State<ChangingProfileScreen> createState() => _ChangingProfileScreenState();
}

class _ChangingProfileScreenState extends State<ChangingProfileScreen> {
  final thisformKey = GlobalKey<FormState>();
  Color containerColor = const Color(0xff0085FF);
  bool _isHover = false;
  String newContent = "";

  void saveEditedData() async {
    final auth = FirebaseAuth.instance;
    //shorten the _auth.currentUser! syntax
    globals.userData = auth.currentUser!;
    //get hold of the users collection
    final users = FirebaseFirestore.instance.collection('users');
    //get hold of the documents which is the user.uid and get the data
    await users.doc(globals.userData.uid).update({widget.keyword: newContent});
  }

  @override
  Widget build(BuildContext context) {
    void validateAndSave() {
      if (thisformKey.currentState!.validate()) {
        thisformKey.currentState!.save();
        saveEditedData();
        Navigator.pop(context);
      }
    }

    void changeColor() {
      if (_isHover == false) {
        setState(() {
          _isHover = true;
          containerColor = const Color(0xff0085FF).withOpacity(0.65);
        });
      } else {
        setState(() {
          _isHover = false;
          containerColor = const Color(0xff0085FF).withOpacity(1);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color.fromRGBO(0, 0, 0, 0.65),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: thisformKey,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: widget.title,
                    contentPadding: const EdgeInsets.only(top: 10, left: 8),
                    enabledBorder: const OutlineInputBorder(),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        width: 3,
                      ),
                    ),
                  ),
                  initialValue: widget.content,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.contains(
                          RegExp(r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/'),
                        )) {
                      return 'Please make sure you has the correct input';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    newContent = newValue!;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    validateAndSave();
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
                          'Save',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
