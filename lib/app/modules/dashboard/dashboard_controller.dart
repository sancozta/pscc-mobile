import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/controllers/auth_controller.dart';
import 'package:pscc/app/shared/models/account.dart';
import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/shared/services/account_service.dart';

class DashboardController extends GetxController {
  final AuthController authController = Get.find();
  final AccountService accounts = Get.find();
  final AuthService authService = Get.find();
  final GetStorage storage = Get.find();

  get isPortrait => Get.context.isPortrait;

  final Rx<Account> account = Rx(Account());
  final RxBool dark = false.obs;

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    this.accounts.selectById(authController.data.value.uid).then((data) {
      this.account.value = data;
      print("##########################################################");
      print(this.account.value);
    });
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    this.dark.value = Get.isDarkMode;
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult data) {
      this.authService.network = data == ConnectivityResult.none;
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
  }

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
