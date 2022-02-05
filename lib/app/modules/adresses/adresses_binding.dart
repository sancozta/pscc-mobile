import 'package:get/get.dart';

import 'adresses_controller.dart';

class AdressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdressesController>(
      () => AdressesController(),
    );
  }
}
