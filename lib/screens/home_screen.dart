import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  String? userEmail;
  var hasLoaded = false;
  String userName = '';

  void getCurrentUserData() async {
    final user = _auth.currentUser!;
    final users = FirebaseFirestore.instance.collection('users');
    final userData = await users.doc(user.uid).get();
    setState(
      () {
        userName = userData.data()!['username'];
      },
    );
    userEmail = user.email;
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUserData();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $userName',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Color(0xff0085FF),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: Constant.boxDecorationA,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: Constant.boxDecorationA,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: Constant.boxDecorationA,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: Constant.boxDecorationA,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: Constant.boxDecorationA,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
