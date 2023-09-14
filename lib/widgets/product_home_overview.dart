import 'package:flutter/material.dart';
import 'package:mechar/models/furniture_assets.dart';

class ProductHomeOverview extends StatelessWidget {
  const ProductHomeOverview({super.key, required this.furniture});
  final Furniture furniture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hi');
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.grey),
          child: Image.network(
            furniture.imgUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
