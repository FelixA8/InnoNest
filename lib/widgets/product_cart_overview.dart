import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/models/cart_models.dart';
import 'package:mechar/libraries/globals.dart' as globals;

class ProductCartOverview extends StatefulWidget {
  const ProductCartOverview(
      {super.key,
      required this.cartID,
      required this.amount,
      required this.onChecked,
      required this.getTotalAmount});
  final String cartID;
  final int amount;
  final bool onChecked;
  final void Function() getTotalAmount;
  @override
  State<ProductCartOverview> createState() => _ProductCartOverviewState();
}

class _ProductCartOverviewState extends State<ProductCartOverview> {
  Cart? currentCart;
  DocumentReference? docRef;
  int currentDataAmount = 0;
  bool onChecked = false;

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

  void getDoc(String furnitureID) {
    docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .doc(furnitureID);
  }

  Future getAmountSnapshots(String furnitureID) async {
    currentDataAmount = 0;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .doc(furnitureID)
        .get();
    var test = userData.data()!['amount'];
    setState(() {
      currentDataAmount = test;
    });
  }

  Future getOnCheckedSnapshots(String furnitureID) async {
    onChecked = false;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .doc(furnitureID)
        .get();
    var test = userData.data()!['onChecked'];
    setState(() {
      onChecked = test;
    });
  }

  void addAmount(String furnitureID) async {
    await getAmountSnapshots(furnitureID);
    currentDataAmount += 1;
    await docRef!.update({'amount': currentDataAmount});
    widget.getTotalAmount();
  }

  void removeAmount(String furnitureID) async {
    await getAmountSnapshots(furnitureID);
    currentDataAmount -= 1;
    await docRef!.update({'amount': currentDataAmount});
    widget.getTotalAmount();
  }

  void deleteAmount() async {
    await docRef!.delete();
    widget.getTotalAmount();
  }

  void checkAmount(String furnitureID) async {
    await getOnCheckedSnapshots(furnitureID);
    onChecked = !onChecked;
    await docRef!.update({'onChecked': onChecked});
    widget.getTotalAmount();
  }

  @override
  void initState() {
    super.initState();
    getCart();
    getDoc(widget.cartID);
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
                      checkAmount(widget.cartID);
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  deleteAmount();
                });
              },
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
                        onPressed: () {
                          removeAmount(widget.cartID);
                        },
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
                        onPressed: () {
                          addAmount(widget.cartID);
                        },
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
