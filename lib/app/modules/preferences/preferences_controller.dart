import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/controllers/auth_controller.dart';
import 'package:pscc/app/shared/services/auth_service.dart';

class PreferencesController extends GetxController {
  AuthService authService = Get.find();
  AuthController authController = Get.find();
  GetStorage storage = Get.find();

  final RxBool dark = false.obs;

  @override
  void onInit() {
    super.onInit();
    this.dark.value = Get.isDarkMode;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logout() {
    authService.getLogout();
    Get.offAndToNamed(Routes.LOGIN);
  }

  void toogleTheme() {
    this.dark.value = !this.dark.value;
    Get.changeThemeMode(this.dark.value ? ThemeMode.dark : ThemeMode.light);
    storage.write('dark', this.dark.value);
  }
}
