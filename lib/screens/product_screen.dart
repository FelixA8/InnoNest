import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/custom_widgets/image_holder.dart';
import 'package:mechar/models/cart_models.dart';
import 'package:mechar/models/furniture_assets.dart';
import 'package:mechar/libraries/globals.dart' as globals;
import 'package:rflutter_alert/rflutter_alert.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.furniture});
  final Furniture furniture;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Cart? _replyObj;
  DocumentReference? docRef;
  // ignore: prefer_typing_uninitialized_variables
  var docID;
  // ignore: prefer_typing_uninitialized_variables
  var currentDataAmount;

  @override
  void initState() {
    super.initState();
    _replyObj = Cart(furniture: widget.furniture, amount: 1, onChecked: false);
    getDoc();
  }

  void getDoc() {
    docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .withConverter(
          fromFirestore: Cart.fromFirestore,
          toFirestore: (cart, options) => cart.toFirestore(),
        )
        .doc(_replyObj!.furniture.id);
  }

  void addNewCart() async {
    await docRef!.set(_replyObj!);
  }

  Future getAmountSnapshots() async {
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .doc(_replyObj!.furniture.id)
        .get();
    var test = userData.data()!['amount'];
    setState(() {
      currentDataAmount = test;
    });
  }

  void addExistingCart() async {
    await getAmountSnapshots();
    currentDataAmount += 1;
    await docRef!.update({'amount': currentDataAmount});
  }

  Future getID() async {
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .doc(_replyObj!.furniture.id)
        .get();
    if (userData.data() != null) {
      return false;
    } else {
      return true;
    }
  }

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
                        customHeight: 1,
                        customWidth: 1,
                        customURL: widget.furniture.imgUrl,
                        arURL: widget.furniture.arUrl,
                        showAR: true),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rp ${widget.furniture.getFormattedAccount},00',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.furniture.title,
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationDot,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.furniture.location,
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color.fromRGBO(0, 0, 0, 0.65)),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
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
            onPressed: () async {
              Alert(
                context: context,
                type: AlertType.success,
                title: "PRODUCT ADDED TO CART",
                style:
                    AlertStyle(titleStyle: GoogleFonts.poppins(fontSize: 16)),
                buttons: [
                  DialogButton(
                    color: const Color(0xff004380),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ).show();
              // ignore: prefer_typing_uninitialized_variables
              var docID;
              docID = await getID();
              if (docID) {
                addNewCart();
              } else {
                addExistingCart();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff004380),
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
