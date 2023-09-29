import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/models/cart_models.dart';

class HistoryCartOverview extends StatefulWidget {
  const HistoryCartOverview(
      {super.key,
      required this.amount,
      required this.cartID,
      required this.datePurchased});
  final String cartID;
  final DateTime datePurchased;
  final int amount;

  @override
  State<HistoryCartOverview> createState() => _HistoryCartOverviewState();
}

class _HistoryCartOverviewState extends State<HistoryCartOverview> {
  Cart? currentCart;

  void getCart() {
    for (var furniture in furnitureAssets) {
      if (furniture.id == widget.cartID) {
        setState(() {
          currentCart = Cart(
              furniture: furniture, amount: widget.amount, onChecked: false);
          return;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    var d24 = DateFormat('dd/MM/yyyy, HH:mm')
        .format(widget.datePurchased); // 31/12/2000, 22:00
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              d24,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.65),
            ),
            Row(
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CustomImageHolder(
                      customHeight: 1,
                      customWidth: 1,
                      customURL: currentCart!.furniture.imgUrl,
                      arURL: currentCart!.furniture.arUrl,
                      showAR: false),
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
          ],
        ),
      ),
    );
  }
}
