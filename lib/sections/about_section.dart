import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  void _launchURLBrowser() async {
    final Uri url = Uri.parse('https://forms.gle/P3EM5ymEwwAJD1C76');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome To InnoNest Furniture',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff004380)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Introducing InnoNest Furniture, your gateway to a revolutionary shopping experience in the world of interior design. Elevate your home decor with our cutting-edge furniture app that seamlessly blends the physical and digital realms through the power of augmented reality. Welcome to a new era of furniture shopping with InnoNest Furniture!\n\n🛋️ Immersive Augmented Reality: Transform your living space before making a purchase. InnoNest Furniture lets you visualize how our stunning pieces will look in your home through the lens of augmented reality. Simply point your device, and watch as our furniture seamlessly integrates into your space, allowing you to make confident and informed decisions.\n\n🌐 Endless Selection: Explore a vast catalog of high-quality furniture ranging from contemporary to classic styles. InnoNest Furniture ensures that you have access to a diverse array of options, all at your fingertips. Discover the perfect pieces to complement your style and elevate your living spaces.\n\n🎨 Personalized Design Solutions: Tailor your home decor with InnoNest Furniture\'s design customization features. Experiment with colors, materials, and configurations to create a personalized look that suits your taste. Our app empowers you to express your unique style and bring your vision to life.\n\n🛒 Seamless Shopping Experience: InnoNest Furniture doesn\'t just stop at visualization; it simplifies the entire shopping process. Purchase your favorite pieces directly from the app, with a user-friendly interface that ensures a smooth and secure transaction. Say goodbye to guesswork and hello to a hassle-free shopping journey.\n\n📸 Share Your Vision: Show off your potential new living space to friends and family by sharing augmented reality snapshots directly from the app. InnoNest Furniture makes it easy to get opinions and gather feedback before finalizing your design choices.\n\n🌟 Stay Updated with Trends: InnoNest Furniture keeps you ahead of the curve by providing access to the latest trends in furniture and interior design. Be the first to discover and incorporate the hottest styles into your home, creating spaces that are both timeless and on-trend.\n\nExperience the future of furniture shopping with InnoNest Furniture—where innovation meets interior design. Redefine your living spaces, one augmented reality experience at a time. Download InnoNest Furniture now and unlock a world of possibilities for your home.\n\n',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Credits',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff004380)),
                ),
                Text(
                  '3D Models:',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '1. Regal Dreams King Bed Source: https://skfb.ly/oKqLO\n'
                  '2. Bean Bliss Pro Coffee Maker Source: https://skfb.ly/L9EN\n'
                  '3. Heritage Craft Wooden Chair Source: https://skfb.ly/TZIr\n'
                  '4. Executive ErgoCraft Office Chair Source: https://skfb.ly/onZ6s\n'
                  '5. TimberCraft Harvest Table Source: https://skfb.ly/6QXAJ\n'
                  '6. FlexFold Space Saver Table: https://skfb.ly/onZor\n'
                  '7. Ebony Elegance Sofa Source: https://skfb.ly/68QAz\n'
                  '8. Royal Majesty Sofa—a Source: https://skfb.ly/6toLI\n'
                  '9. Arctic Elegance Sofa Source: https://skfb.ly/6BMrN\n'
                  '10. SoloLounger Source: https://skfb.ly/oBJsY\n'
                  '11. TitanCraft Industrial Table Source: https://skfb.ly/6SuQV\n'
                  '12. UltraDesk Compact Desktop Table Source: https://skfb.ly/6BRuF\n'
                  '13. ErgoRelax Ergonomic Chair Source: https://skfb.ly/oo7Ut\n'
                  '14. EliteGamer Pro Series Gaming Chair Source: https://skfb.ly/6YvXV\n'
                  '15. Bed Haven Source: https://skfb.ly/ovQwN\n'
                  '16. SwiftHeat Pro Microwave Source: https://skfb.ly/o6Jzq\n'
                  '17.Deluxe ToastMaster Pro Source: https://skfb.ly/6RGEy\n',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Survey',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff004380)),
                ),
                Text(
                  'Have any Critics or Suggestions? Please fill out this form',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xff004380),
                      ),
                    ),
                    onPressed: _launchURLBrowser,
                    child: Text(
                      'Survey Form',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
