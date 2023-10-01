import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/furniture_assets.dart';
import 'package:mechar/screens/product_screen.dart';

class ProductHomeOverview extends StatefulWidget {
  const ProductHomeOverview({super.key, required this.furniture});
  final Furniture furniture;

  @override
  State<ProductHomeOverview> createState() => _ProductHomeOverviewState();
}

class _ProductHomeOverviewState extends State<ProductHomeOverview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ProductScreen(
                furniture: widget.furniture,
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
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageHolder(
                customHeight: 1,
                customWidth: 1,
                customURL: widget.furniture.imgUrl,
                arURL: widget.furniture.arUrl,
                showAR: false),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.furniture.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rp ${widget.furniture.getFormattedAccount},00',
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.furniture.location,
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ),
          ],
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