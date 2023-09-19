import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/widgets/category_home_icons.dart';
import 'package:mechar/widgets/product_home_overview.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                //seperator or giving space
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: categoryTypeAssets.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryHomeIcon(
                          icons: categoryTypeAssets[index].icons,
                          title: categoryTypeAssets[index].title);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: ListView.separated(
                    itemCount: furnitureAssets.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ProductHomeOverview(
                          furniture: furnitureAssets[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 25,
                      );
                    },
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
