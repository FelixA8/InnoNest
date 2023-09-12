import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/sections/about_section.dart';
import 'package:mechar/sections/account_section.dart';
import 'package:mechar/sections/cart_section.dart';
import 'package:mechar/sections/home_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;
  final _auth = FirebaseAuth.instance;
  String? userEmail;
  var hasLoaded = false;
  String userName = '';
  Widget? status;

  void checkSection() {
    setState(() {
      if (_selectedIndex == 0) {
        status = HomeSection(userName: userName);
      } else if (_selectedIndex == 1) {
        status = CartSection();
      } else if (_selectedIndex == 2) {
        status = AccountSection();
      } else if (_selectedIndex == 3) {
        status = AboutSection();
      }
    });
  }

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
    checkSection();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: status,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff0085FF),
          selectedItemColor: const Color.fromRGBO(255, 255, 255, 0.65),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'About',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              checkSection();
            });
          }),
    );
  }
}
