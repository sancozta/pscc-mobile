import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/controllers/auth_controller.dart';

import 'package:pscc/app/shared/models/product.dart';
import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/shared/services/product_service.dart';

class DashboardController extends GetxController {
  final ProductService products = Get.find();
  final AuthService authService = Get.find();
  final AuthController authController = Get.find();
  final GetStorage storage = Get.find();

  get isPortrait => Get.context.isPortrait;

  final RxList<Product> list = <Product>[].obs;
  final RxBool dark = false.obs;

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    super.onInit();

    this.products.selectAll().then((data) => this.list.value = data);
    this.dark.value = Get.isDarkMode;
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult data) {
      this.authService.network = data == ConnectivityResult.none;
    });
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
