import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/constant.dart';
import 'package:mechar/libraries/globals.dart' as globals;
import 'package:mechar/screens/home_screen.dart';

class GoogleRegisterScreen extends StatefulWidget {
  const GoogleRegisterScreen({super.key});

  @override
  State<GoogleRegisterScreen> createState() => _GoogleRegisterScreenState();
}

class _GoogleRegisterScreenState extends State<GoogleRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  //to shorten the firebaseauth.instance
  final _auth = FirebaseAuth.instance;
  //result of input field
  var _enteredName = '';
  var _enteredAddressLocation = '';
  var _enteredPhoneNumber = '';

  void _register() async {
    print(globals.userData.email);
    //validation
    if (_formKey.currentState!.validate()) {
      //save
      _formKey.currentState!.save();
      //create user and save it to firebase
      globals.userData = _auth.currentUser!;
      //to save the userName, make a new collections ('users') in the firebase firestore.
      await FirebaseFirestore.instance
          .collection('users')
          .doc(globals.userData
              .uid) //add a document reference that refers to the user's UID, when another new UID is set, it will create new documents
          .set(
        {
          'username': _enteredName,
          'email': globals.userData.email,
          'address location': _enteredAddressLocation,
          'phone number': _enteredPhoneNumber,
        }, //.set, inside the document, make a new email and a new username.
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set the content to center
      body: Center(
        //set the padding on the left and right of the screen
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          //to prevent pixel overflow
          child: SingleChildScrollView(
            //set the column
            child: Column(
              //center the column content in the x axis
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SHOW LOGIN/ REGISTER TITLE
                Text(
                  'Register Google',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xff004380),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //SET THE FORM
                Form(
                  //the key to the form (important)
                  key: _formKey,
                  //what will be set in the form
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          //a text form field for name
                          decoration: Constant
                              .formDecorationA //a dart class that stores widget (to shorten the code)
                              .copyWith(
                                  hintText:
                                      'name'), //modify the widget only for this decoration
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          //validation that triggers when the '_formKey.currentState!.validate()' function is called
                          validator: (value) {
                            //return a text if validation is false
                            if (value!.isEmpty || value.trim().length < 2) {
                              return 'Please enter a valid name';
                            }
                            //return null if validation is correct
                            return null;
                          },
                          //method that triggers when the '_formKey.currentState!.save()' is called
                          onSaved: (newValue) {
                            _enteredName =
                                newValue!; //set the new entered name into _enteredName variable
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          //a text form field for name
                          decoration: Constant
                              .formDecorationA //a dart class that stores widget (to shorten the code)
                              .copyWith(
                                  hintText:
                                      'Location Address'), //modify the widget only for this decoration
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          //validation that triggers when the '_formKey.currentState!.validate()' function is called
                          validator: (value) {
                            //return a text if validation is false
                            if (value!.isEmpty || value.trim().length < 2) {
                              return 'Please enter a valid address';
                            }
                            //return null if validation is correct
                            return null;
                          },
                          //method that triggers when the '_formKey.currentState!.save()' is called
                          onSaved: (newValue) {
                            _enteredAddressLocation =
                                newValue!; //set the new entered name into _enteredName variable
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          //a text form field for name
                          decoration: Constant
                              .formDecorationA //a dart class that stores widget (to shorten the code)
                              .copyWith(
                                  hintText:
                                      'Phone Number'), //modify the widget only for this decoration
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          //validation that triggers when the '_formKey.currentState!.validate()' function is called
                          validator: (value) {
                            //return a text if validation is false
                            if (value!.isEmpty ||
                                value.trim().length < 12 ||
                                value.contains(RegExp(r'^[a-zA-Z]+$'))) {
                              return 'Please enter a valid phone number';
                            }
                            //return null if validation is correct
                            return null;
                          },
                          //method that triggers when the '_formKey.currentState!.save()' is called
                          onSaved: (newValue) {
                            _enteredPhoneNumber =
                                newValue!; //set the new entered name into _enteredName variable
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //the button which either trigger the login/ register method
                FilledButton(
                  onPressed:
                      _register, //if the user is in the login state, then trigger the login method when clicked.
                  //else trigger the register method if the user is in the register state
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 40)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff004380))),
                  child: Text(
                    "Register Data",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
