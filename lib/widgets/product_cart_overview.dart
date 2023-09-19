import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/cart_models.dart';

class ProductCartOverview extends StatefulWidget {
  const ProductCartOverview({super.key, required this.cart});
  final Cart cart;

  @override
  State<ProductCartOverview> createState() => _ProductCartOverviewState();
}

class _ProductCartOverviewState extends State<ProductCartOverview> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                  value: widget.cart.onChecked,
                  onChanged: (value) {
                    setState(() {
                      widget.cart.onChecked = value!;
                    });
                  }),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 70,
                height: 70,
                child: CustomImageHolder(
                    customHeight: 1,
                    customWidth: 1,
                    customURL: widget.cart.furniture.imgUrl)),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.furniture.title,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                Text(
                  'Jakarta Barat',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                Text(
                  'Rp ${widget.cart.furniture.getFormattedAccount},00',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.trashCan),
            ),
            Container(
              width: 80,
              height: 25,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.minus,
                          size: 12,
                        ),
                      ),
                    ),
                    Text(
                      widget.cart.amount.toString(),
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
