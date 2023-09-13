import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

class Furniture {
  Furniture(
      {required this.title,
      required this.price,
      required this.imgUrl,
      required this.arUrl})
      : id = uuid.v4();
  String id;
  String title;
  double price;
  String imgUrl;
  String arUrl;

  String get getFormattedAccount {
    return NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0)
        .format(price);
  }
}
