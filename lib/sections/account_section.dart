import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  Future<void> _signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0085FF), // Background color
            ),
            onPressed: () {
              _signOut();
            },
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            )),
      ),
    );
  }
}
