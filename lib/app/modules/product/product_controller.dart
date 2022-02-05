import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pscc/app/shared/models/images.dart';
import 'package:pscc/app/shared/models/product.dart';
import 'package:pscc/app/shared/services/product_service.dart';

class ProductController extends GetxController {
  final ProductService products = Get.find();

  final current = 0.obs;
  final Rxn<Product> product = new Rxn<Product>();

  List<Widget> convertListInWidgets(List<Images> list) {
    return list.map((img) {
      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.network(
                img.url,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  List<Widget> convertListInWidgetsDot(List<Images> list, int current) {
    return list.map((img) {
      return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: current == list.indexOf(img) ? Colors.black87 : Colors.black45,
        ),
      );
    }).toList();
  }

  @override
  void onInit() {
    var uid = Get.arguments;
    this.products.selectById(uid).then((data) => this.product.value = data);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String getLink(String uid) {
    return "https://www.duolingo.com/learn/$uid";
  }
}
