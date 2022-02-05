import 'package:get/get.dart';

import 'package:pscc/app/shared/services/product_service.dart';
import 'product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProductService>(() => ProductService());
  }
}
