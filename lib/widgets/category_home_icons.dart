import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHomeIcon extends StatelessWidget {
  const CategoryHomeIcon({super.key, required this.icons, required this.title});
  final FaIcon icons;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff0085FF),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      height: 100,
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icons,
            Text(
              title,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
