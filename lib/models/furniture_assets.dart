import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category {
  sofa,
  table,
  chair,
  kitchen,
  bed,
  none,
}

class Furniture {
  Furniture(
      {required this.title,
      required this.price,
      required this.imgUrl,
      required this.arUrl,
      required this.category,
      required this.description,
      required this.location,
      required this.id});
  String id;
  String title;
  String location;
  double price;
  String imgUrl;
  String arUrl;
  Category category;
  String description;

  String get getFormattedAccount {
    return NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0)
        .format(price);
  }
}
