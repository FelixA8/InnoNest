import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
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
                  shrinkWrap: true,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://drive.google.com/uc?export=download&id=1uQXpcp7n6JLqMgUi8AulnXRf5yUOAq__'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
