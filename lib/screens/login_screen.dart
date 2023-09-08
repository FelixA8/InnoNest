import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/constant.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  var _enteredName = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isLogin = true;
  var title = 'Login';

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    await _auth.signInWithEmailAndPassword(
        email: _enteredEmail, password: _enteredPassword);
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(
        {
          'username': _enteredName,
          'email': _enteredEmail,
        },
      );
    }
  }

  void setToRegister() {
    setState(() {
      title = 'Register';
      _isLogin = false;
    });
  }

  void setToLogin() {
    setState(() {
      title = 'Login';
      _isLogin = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xff0085FF),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      _isLogin
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                decoration: Constant.formDecorationA
                                    .copyWith(hintText: 'name'),
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      value.trim().length < 2) {
                                    return 'Please enter a valid name';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  _enteredName = newValue!;
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
                          decoration: Constant.formDecorationA,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _enteredEmail = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          obscureText: true,
                          decoration: Constant.formDecorationA
                              .copyWith(hintText: 'password'),
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 8) {
                              return 'Password should have more than 8 characters';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            _enteredPassword = newValue!;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: _isLogin ? _login : _register,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 40)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff0085FF))),
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
                                  color: Color(0xff0085FF),
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
                                  color: Color(0xff0085FF),
                                  //kontol
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
