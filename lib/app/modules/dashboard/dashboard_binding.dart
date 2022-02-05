import 'package:get/get.dart';

import 'package:pscc/app/shared/services/product_service.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProductService>(() => ProductService());
  }
}
