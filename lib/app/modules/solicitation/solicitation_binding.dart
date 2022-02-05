import 'package:get/get.dart';

import 'solicitation_controller.dart';

class SolicitationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SolicitationController>(
      () => SolicitationController(),
    );
  }
}
