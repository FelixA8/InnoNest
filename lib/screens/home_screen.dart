import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  String? userEmail;

  String? userName;

  void getCurrentUserData() async {
    final user = _auth.currentUser!;
    final users = FirebaseFirestore.instance.collection('users');
    final userData = await users.doc(user.uid).get();
    setState(() {
      userName = userData.data()!['username'];
    });
    userEmail = user.email;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $userName',
              style: const TextStyle(color: Colors.blue, fontSize: 50),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
