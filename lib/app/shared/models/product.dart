import 'package:flutter/material.dart';

import 'package:pscc/app/shared/models/images.dart';
import 'package:pscc/app/shared/services/util_service.dart';

class Product {
  String uid;
  String title;
  String description;
  String category;
  String order;
  DateTime date;
  double price;
  List<Images> images;

  Product({
    @optionalTypeArgs this.uid,
    @optionalTypeArgs this.title,
    @optionalTypeArgs this.description,
    @optionalTypeArgs this.category,
    @optionalTypeArgs this.order,
    @optionalTypeArgs this.date,
    @optionalTypeArgs this.price,
    @optionalTypeArgs this.images,
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
    images = data.containsKey('images') ? Product.getListImages(data['images']) : [];
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
      'images': images,
    };
  }

  static List<Images> getListImages(List<dynamic> list) {
    return list.map((e) => new Images(path: e['path'] ?? '', url: e['url'] ?? '')).toList();
  }

  static String getPresentation(List<Images> list) {
    return list.isNotEmpty ? list[0].url : '';
  }

  static collection() {
    return 'products';
  }
}
