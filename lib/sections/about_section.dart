import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
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
                  'Welcome To MechAR Furniture',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0085FF)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Introducing MechAR Furniture, your gateway to a revolutionary shopping experience in the world of interior design. Elevate your home decor with our cutting-edge furniture app that seamlessly blends the physical and digital realms through the power of augmented reality. Welcome to a new era of furniture shopping with MechAR Furniture!\n\n🛋️ Immersive Augmented Reality: Transform your living space before making a purchase. MechAR Furniture lets you visualize how our stunning pieces will look in your home through the lens of augmented reality. Simply point your device, and watch as our furniture seamlessly integrates into your space, allowing you to make confident and informed decisions.\n\n🌐 Endless Selection: Explore a vast catalog of high-quality furniture ranging from contemporary to classic styles. MechAR Furniture ensures that you have access to a diverse array of options, all at your fingertips. Discover the perfect pieces to complement your style and elevate your living spaces.\n\n🎨 Personalized Design Solutions: Tailor your home decor with MechAR Furniture\'s design customization features. Experiment with colors, materials, and configurations to create a personalized look that suits your taste. Our app empowers you to express your unique style and bring your vision to life.\n\n🛒 Seamless Shopping Experience: MechAR Furniture doesn\'t just stop at visualization; it simplifies the entire shopping process. Purchase your favorite pieces directly from the app, with a user-friendly interface that ensures a smooth and secure transaction. Say goodbye to guesswork and hello to a hassle-free shopping journey.\n\n📸 Share Your Vision: Show off your potential new living space to friends and family by sharing augmented reality snapshots directly from the app. MechAR Furniture makes it easy to get opinions and gather feedback before finalizing your design choices.\n\n🌟 Stay Updated with Trends: MechAR Furniture keeps you ahead of the curve by providing access to the latest trends in furniture and interior design. Be the first to discover and incorporate the hottest styles into your home, creating spaces that are both timeless and on-trend.\n\nExperience the future of furniture shopping with MechAR Furniture—where innovation meets interior design. Redefine your living spaces, one augmented reality experience at a time. Download MechAR Furniture now and unlock a world of possibilities for your home.\n\n',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Credits',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0085FF)),
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
                  '9. Arctic Elegance Sofa Source: https://skfb.ly/6BMrN\n',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
