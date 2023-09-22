import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/models/cart_models.dart';

class ProductCartOverview extends StatefulWidget {
  const ProductCartOverview(
      {super.key,
      required this.cartID,
      required this.amount,
      required this.onChecked});
  final String cartID;
  final int amount;
  final bool onChecked;

  @override
  State<ProductCartOverview> createState() => _ProductCartOverviewState();
}

class _ProductCartOverviewState extends State<ProductCartOverview> {
  Cart? currentCart;

  @override
  void dispose() {
    super.dispose();
  }

  void getCart() {
    for (var furniture in furnitureAssets) {
      if (furniture.id == widget.cartID) {
        setState(() {
          currentCart = Cart(
              furniture: furniture,
              amount: widget.amount,
              onChecked: widget.onChecked);
          return;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    // print(currentCart!.furniture.title);
    int amount = widget.amount;
    bool onChecked = widget.onChecked;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                  value: onChecked,
                  onChanged: (value) {
                    setState(() {
                      onChecked = value!;
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
                  customURL: currentCart!.furniture.imgUrl),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentCart!.furniture.title,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                Text(
                  'Jakarta Barat',
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                Text(
                  'Rp ${currentCart!.furniture.getFormattedAccount},00',
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
                      amount.toString(),
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
