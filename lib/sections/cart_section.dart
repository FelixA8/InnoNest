import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/libraries/globals.dart' as globals;
import 'package:mechar/widgets/product_cart_overview.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  var selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cart',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: selectAll,
                      onChanged: (value) {
                        setState(() {
                          selectAll = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Select All',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.mapLocationDot,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.black),
                      children: const [
                        TextSpan(text: 'Dikirim ke '),
                        TextSpan(
                          text: 'Binus University',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(globals.userData.uid)
                    .collection('cart')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('no cart added'),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Oops, something went wrong'),
                    );
                  }
                  final loadedData = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: loadedData.length,
                    itemBuilder: (context, index) {
                      final cartData = loadedData[index].data();
                      return ProductCartOverview(
                          cartID: cartData['productID'].toString(),
                          amount: cartData['amount'],
                          onChecked: cartData['onChecked']);
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.separated(
//                   itemCount: cardAssets.length,
//                   itemBuilder: (context, index) {
//                     return ProductCartOverview(cart: cardAssets[index]);
//                   },
//                   separatorBuilder: (context, index) {
//                     return const SizedBox(
//                       height: 25,
//                     );
//                   },
//                 ),