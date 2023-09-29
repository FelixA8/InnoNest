import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/models/furniture_assets.dart';
import 'package:mechar/widgets/product_home_overview.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen(
      {super.key, required this.category, required this.title});
  final String title;
  final Category category;
  List<FurnitureBuckets> get buckets {
    return [
      FurnitureBuckets.forCategory(furnitureAssets, category),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final sortedFurniture =
        FurnitureBuckets.forCategory(furnitureAssets, category);
    sortedFurniture.category;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 3),
              itemCount: buckets[0].furniture.length,
              itemBuilder: (context, index) {
                return ProductHomeOverview(
                  furniture: buckets[0].furniture[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FurnitureBuckets {
  const FurnitureBuckets({required this.category, required this.furniture});
  FurnitureBuckets.forCategory(List<Furniture> allFurniture, this.category)
      : furniture = allFurniture
            .where((furniture) => furniture.category == category)
            .toList(); //utility/custom constructor
  final Category category;
  final List<Furniture> furniture;
}
