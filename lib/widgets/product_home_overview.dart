import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mechar/models/furniture_assets.dart';
import 'package:mechar/screens/product_screen.dart';

class ProductHomeOverview extends StatefulWidget {
  const ProductHomeOverview({super.key, required this.furniture});
  final Furniture furniture;

  @override
  State<ProductHomeOverview> createState() => _ProductHomeOverviewState();
}

class _ProductHomeOverviewState extends State<ProductHomeOverview> {
  String imageURL =
      "https://drive.google.com/uc?export=download&id=1XNOVj73YECeHQGocFrTO-Kgb2TR42qS3";
  Future<void> getDownloadURL(imgPath) async {
    final storageRef = FirebaseStorage.instance.ref();
    final ref = storageRef.child(imgPath);
    String url = await ref.getDownloadURL();

    setState(() {
      imageURL = url;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDownloadURL(widget.furniture.imgUrl);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProductScreen(furniture: widget.furniture);
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
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.grey),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Image.network(
              imageURL,
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
      ),
    );
  }
}

// sofa 1: Furniture Assets/Sofa/Sofa 1/Screenshot (18).png
// sofa 2: Furniture Assets/Sofa/Sofa 2/Screenshot (19).png
// sofa 3: Furniture Assets/Sofa/Sofa 3/Screenshot (16).png
// folding table 1: Furniture Assets/Table/Folding Table/Screenshot 2023-09-11 170632.png
// wooden table 1: Furniture Assets/Table/Wooden Table/Screenshot 2023-09-11 170816.png
// office chair 1: Furniture Assets/Chair/Office Chair 1/Screenshot 2023-09-11 171114 (1).png
// wooden chair 1: Furniture Assets/Chair/Wooden Chair 1/Screenshot 2023-09-11 171450.png
//  coffee maker: Furniture Assets/Kitchen/Coffee maker 1/Screenshot 2023-09-11 171932.png
// bed 1: Furniture Assets/Bed/Bed 1/Screenshot 2023-09-11 172543.png