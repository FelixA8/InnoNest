import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechar/models/furniture_assets.dart';

class Cart {
  Cart(
      {required this.furniture,
      required this.amount,
      required this.onChecked,
      this.time});

  Furniture furniture;
  int amount;
  bool onChecked = false;
  // ignore: prefer_typing_uninitialized_variables
  final time;

  Map<String, dynamic> toJson() => {
        'furniture': furniture,
        'amount': amount,
        'onChecked': onChecked,
        'time': DateTime.now()
      };

  factory Cart.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Cart(
      furniture: data?['furniture'],
      amount: data?['amount'],
      onChecked: data?['onChecked'],
      time: data?['time'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "productID": furniture.id,
      "amount": amount,
      "onChecked": onChecked,
      "time": DateTime.now(),
    };
  }
}
