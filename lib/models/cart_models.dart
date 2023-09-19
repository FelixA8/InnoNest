import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechar/models/furniture_assets.dart';

class Cart {
  Cart(
      {required this.furniture, required this.amount, required this.onChecked});

  Furniture furniture;
  int amount;
  bool onChecked = false;

  Map<String, dynamic> toJson() =>
      {'furniture': furniture, 'amount': amount, 'onChecked': onChecked};

  factory Cart.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Cart(
        furniture: data?['furniture'],
        amount: data?['amount'],
        onChecked: data?['onChecked']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "productID": furniture.title,
      "amount": amount,
      "onChecked": onChecked,
    };
  }
}
