import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/models/furniture_assets.dart';
import 'package:mechar/screens/product_categories_screen.dart';

class CategoryHomeIcon extends StatelessWidget {
  const CategoryHomeIcon(
      {super.key,
      required this.icons,
      required this.title,
      required this.category});
  final FaIcon icons;
  final String title;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProductCategoryScreen(
                category: category,
                title: title,
              );
            },
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1, 0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff004380),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 100,
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 5),
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
      ),
    );
  }
}
