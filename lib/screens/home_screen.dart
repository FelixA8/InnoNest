import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechar/sections/about_section.dart';
import 'package:mechar/sections/account_section.dart';
import 'package:mechar/sections/cart_section.dart';
import 'package:mechar/sections/home_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechar/libraries/globals.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //to check the index status of the section in the bottom navbar
  var _selectedIndex = 0;
  //to shorten the firebaseauth.instance
  final _auth = FirebaseAuth.instance;
  String? userEmail;
  //variable the has not been used yet
  var hasLoaded = false;
  String userName = '';
  //status of the current widget based on the index status
  Widget? status;

  void checkSection() {
    //change the state of the screen section
    setState(() {
      if (_selectedIndex == 0) {
        //if index is 0, show home section.
        status = HomeSection(userName: userName);
      } else if (_selectedIndex == 1) {
        //if index is 1, show cart section.
        status = const CartSection();
      } else if (_selectedIndex == 2) {
        //if index is 2, show account section.
        status = const AccountSection();
      } else if (_selectedIndex == 3) {
        //if index is 3, show about section.
        status = const AboutSection();
      }
    });
  }

  //function that gathers user's data once logged in
  void getCurrentUserData() async {
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
    super.initState();
    //when first time load the screen, run the function
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    //check the current status of the screen
    checkSection();
    return Scaffold(
      body: status, //show the widget based on the selected navbar
      //the bottom navbar
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType
              .fixed, //when there is 4 or more navbar items, use this method
          backgroundColor: const Color(0xff0085FF),
          selectedItemColor: const Color.fromRGBO(255, 255, 255,
              0.65), //selected items has different colors from the others
          unselectedItemColor:
              Colors.white, //unselected items has it's own colors
          items: const [
            //set the bottom navbar UI and icon for home section
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimneyWindow),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            //set the bottom navbar UI and icon for cart section
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.cartShopping),
              label: 'Cart',
            ),
            //set the bottom navbar UI and icon for account section
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAstronaut),
              label: 'Account',
            ),
            //set the bottom navbar UI and icon for about section
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.info),
              label: 'About',
            ),
          ],
          //check the current seleted index
          currentIndex: _selectedIndex,
          //when other navbar button is pressed, it will refer to the value (index). Use that to set another widget/ screen.
          onTap: (value) {
            setState(() {
              //change the state of the selected index value and check the section again
              _selectedIndex = value;
              checkSection();
            });
          }),
    );
  }
}
