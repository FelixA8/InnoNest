import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mechar/libraries/globals.dart' as globals;
import 'package:mechar/widgets/history_cart_overview.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  CollectionReference? docRef;
  void getDoc() {
    docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(globals.userData.uid)
        .collection('history');
  }

  @override
  void initState() {
    super.initState();
    getDoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purchase History',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              color: const Color(0xff0085FF),
              width: 230,
              height: 5,
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(globals.userData.uid)
                    .collection('history')
                    .orderBy('date', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('History are still empty, buy something :D'),
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
                      DateTime dt = (cartData['date'] as Timestamp).toDate();
                      return HistoryCartOverview(
                        amount: cartData['amount'],
                        cartID: cartData['productID'],
                        datePurchased: dt,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
