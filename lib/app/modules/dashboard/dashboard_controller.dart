import 'package:get/get.dart';

import 'package:pscc/app/shared/models/product.dart';
import 'package:pscc/app/shared/services/product_service.dart';

class DashboardController extends GetxController {
  final ProductService products = Get.find();

  get isPortrait => Get.context.isPortrait;

  final RxList<Product> list = <Product>[].obs;

  @override
  void onInit() {
    this.products.selectAll().then((data) => this.list.value = data);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
