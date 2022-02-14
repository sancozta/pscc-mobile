import 'package:pscc/app/shared/services/util_service.dart';

class Product {
  String uid;
  String title;
  String description;
  String category;
  String order;
  DateTime date;
  double price;

  Product({
    this.uid,
    this.title,
    this.description,
    this.category,
    this.order,
    this.date,
    this.price,
  });

  Product.fromMap(String id, Map data) {
    uid = id ?? '';
    title = data['title'] ?? '';
    description = data['description'] ?? '';
    category = data['category'] ?? '';
    order = data['order'] ?? '';
    date = data.containsKey('date')
        ? DateTime.fromMicrosecondsSinceEpoch(data['date']?.microsecondsSinceEpoch)
        : DateTime.now();
    price = UtilService.stringRealToDouble(data['price']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
      'category': category,
      'order': order,
      'date': date,
      'price': price,
    };
  }

  static collection() {
    return 'products';
  }
}
