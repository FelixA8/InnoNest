import 'package:action_slider/action_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mechar/libraries/globals.dart' as globals;
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/screens/success_purchase_screen.dart';
import 'package:mechar/widgets/product_cart_overview.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  var selectAll = false;
  // ignore: prefer_typing_uninitialized_variables
  DocumentReference? docRef;
  double total = 0;
  bool isSelectItem = false;
  bool onChecked = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getTotalAmount();
    checkIfSelected();
  }

  void checkIfSelected() async {
    isSelectItem = false;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        if (docSnapshot.data()['onChecked'] == true) {
          isSelectItem = true;
          break;
        }
      }
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

  Future<void> batchDelete() {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    return FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        if (document.data()['onChecked'] == true) {
          batch.delete(document.reference);
        }
      });
      return batch.commit();
    });
  }

  void deletePurchasedItems() async {
    await batchDelete();
    getTotalAmount();
    checkIfSelected();
  }

  void selectAllCheckBox() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .get()
        .then((querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        if (selectAll == true) {
          if (docSnapshot.data()['onChecked'] == false) {
            docSnapshot.reference.update({'onChecked': true});
          }
        } else {
          if (docSnapshot.data()['onChecked'] == true) {
            docSnapshot.reference.update({'onChecked': false});
          }
        }
      }
    });
    getTotalAmount();
    checkIfSelected();
  }

  void getTotalAmount() async {
    total = 0;
    FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('cart')
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isEmpty) {
        setState(() {
          total = 0;
        });
      } else {
        for (var docSnapshot in querySnapshot.docs) {
          var amount = docSnapshot.data()['amount'];
          double price = 0;
          for (var furniture in furnitureAssets) {
            if (furniture.id == docSnapshot.data()['productID'] &&
                docSnapshot.data()['onChecked'] == true) {
              price = furniture.price;
              break;
            }
          }
          total += (amount * price);
          setState(() {});
        }
      }
    });
  }

  String getFormattedAccount(price) {
    return NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0)
        .format(price);
  }

  void changeToSuccessScreen() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const SuccessPurchaseScreen();
        },
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
  }

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
                      onChanged: (value) async {
                        if (selectAll == true) {
                          selectAll = value!;
                          selectAllCheckBox();
                        } else {
                          selectAll = value!;
                          selectAllCheckBox();
                        }
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
                          onChecked: cartData['onChecked'],
                          getTotalAmount: getTotalAmount,
                          checkIfSelected: checkIfSelected,
                        );
                      },
                    );
                  },
                ),
              ),
              Text(
                'Total Price:',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              Text(
                'Rp. ${getFormattedAccount(total)},00',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              isSelectItem
                  ? ActionSlider.standard(
                      height: 60,
                      child: Text(
                        'Swipe to Purchase',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                      action: (controller) async {
                        controller.loading(); //starts loading animation
                        // await Future.delayed(const Duration(seconds: 3));
                        deletePurchasedItems();
                        changeToSuccessScreen();
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
