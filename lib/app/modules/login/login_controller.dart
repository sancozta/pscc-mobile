import 'package:get/get.dart';

import 'package:pscc/app/shared/controllers/auth_controller.dart';
import 'package:pscc/app/shared/services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService authService = Get.find();
  final AuthController authController = Get.find();

  @override
  void onClose() {}
}
