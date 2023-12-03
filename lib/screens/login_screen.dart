import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //global key for listening to the data that is inputted
  final _formKey = GlobalKey<FormState>();
  //to shorten the firebaseauth.instance
  final _auth = FirebaseAuth.instance;
  //result of input field
  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredAddressLocation = '';
  var _enteredPhoneNumber = '';
  //a boolean to check whether the user is in login/ register state
  var _isLogin = true;
  //a string to show title
  var title = 'Login';

  //login function where it will validate the data inputted. When the validation is true, then save the data
  //which will trigger the onSaved method in the textfield widget. Then, authenticate the user.
  void _login() async {
    //validate
    if (_formKey.currentState!.validate()) {
      //save the data
      _formKey.currentState!.save();
    }
    //authentication system. If authentication is valid, then the Streambuilder in main.dart will trigger to the
    //home screen widget.
    try {
      await _auth.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException {
      showAlertDialogForFalseEmailOrPass();
    }
  }

  void googleLogin() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (e) {
      print(e);
    }
  }

  void showAlertDialogForFalseEmailOrPass() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Wrong Email or Password",
      desc: "Please use the correct email or password",
      style: AlertStyle(
        titleStyle: GoogleFonts.poppins(fontSize: 20),
        descStyle: GoogleFonts.poppins(fontSize: 12),
      ),
      buttons: [
        DialogButton(
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "Close",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  //register function where it will validate the data inputted. When the validation is true, then save the data
  //which will trigger the onSaved method in the textfield widget. Then, make a new user.
  void _register() async {
    //validation
    if (_formKey.currentState!.validate()) {
      //save
      _formKey.currentState!.save();
      //create user and save it to firebase
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
      //to save the userName, make a new collections ('users') in the firebase firestore.
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!
              .uid) //add a document reference that refers to the user's UID, when another new UID is set, it will create new documents
          .set(
        {
          'username': _enteredName,
          'email': _enteredEmail,
          'address location': _enteredAddressLocation,
          'phone number': _enteredPhoneNumber,
        }, //.set, inside the document, make a new email and a new username.
      );
    }
  }

  //when user want's to register, set the new UI for it
  void setToRegister() {
    //change the state of the screen
    setState(() {
      title = 'Register';
      _isLogin = false;
    });
  }

  //when user want's to login, set the new UI for it
  void setToLogin() {
    //change the state of the screen
    setState(() {
      title = 'Login';
      _isLogin = true;
    });
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
                  title,
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
                      //if the user is in the login page, show nothing. else show a textformfield for the name
                      _isLogin
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                                  if (value!.isEmpty ||
                                      value.trim().length < 2) {
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
                      _isLogin
                          ? Container()
                          : const SizedBox(
                              height: 20,
                            ),
                      _isLogin
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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
                                  if (value!.isEmpty ||
                                      value.trim().length < 2) {
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
                      _isLogin
                          ? Container()
                          : const SizedBox(
                              height: 20,
                            ),
                      _isLogin
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
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

                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: TextFormField(
                          //a text form field for email
                          decoration: Constant.formDecorationA,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          //validation that triggers when the '_formKey.currentState!.validate()' function is called
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _enteredEmail =
                                newValue!; //set the new entered email into _enteredEmail variable
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          obscureText: true, //hidden the text
                          decoration: Constant.formDecorationA
                              .copyWith(hintText: 'password'),
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          //validation that triggers when the '_formKey.currentState!.validate()' function is called
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 8) {
                              return 'Password should have more than 8 characters';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _enteredPassword =
                                newValue!; //set the new entered email into _enteredPassword variable
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
                  onPressed: _isLogin
                      ? _login
                      : _register, //if the user is in the login state, then trigger the login method when clicked.
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
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                    onPressed: () {
                      googleLogin();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.blue,
                      size: 35,
                    )),
                const SizedBox(
                  height: 20,
                ),
                //change the text based on the status of the login/ register state
                _isLogin == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'don’t have an account? ',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //Register Page
                              setToRegister();
                            },
                            child: Text(
                              'Register now',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff004380),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account? ',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _isLogin ? setToRegister() : setToLogin();
                            },
                            child: Text(
                              'Login now',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff004380),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
