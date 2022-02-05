import 'package:get/get.dart';

import 'package:pscc/app/shared/controllers/auth_controller.dart';
import 'package:pscc/app/shared/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService authService = Get.find();
  final AuthController authController = Get.find();

  final opacityLevel = 0.0.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      opacityLevel.value = 1.0;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
