import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/furniture_assets.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.furniture});
  final Furniture furniture;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageHolder(
                        customHeight: 9,
                        customWidth: 16,
                        customURL: widget.furniture.imgUrl),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.furniture.title,
                      style: GoogleFonts.poppins(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rp ${widget.furniture.getFormattedAccount},00',
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.furniture.description,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          color: Colors.white,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0085FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Add to Cart',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
