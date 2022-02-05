import 'package:get/get.dart';

import 'package:pscc/app/modules/dashboard/dashboard_controller.dart';
import 'package:pscc/app/modules/home/home_controller.dart';
import 'package:pscc/app/modules/preferences/preferences_controller.dart';
import 'package:pscc/app/modules/solicitation/solicitation_controller.dart';
import 'package:pscc/app/shared/services/product_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SolicitationController>(() => SolicitationController());
    Get.lazyPut<PreferencesController>(() => PreferencesController());
    Get.lazyPut<ProductService>(() => ProductService());
  }
}
