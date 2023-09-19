import 'package:mechar/models/furniture_assets.dart';

class Cart {
  Cart({required this.furniture, required this.amount});

  final Furniture furniture;
  final int amount;
  bool onChecked = false;
}
