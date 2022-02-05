import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/modules/dashboard/dashboard_view.dart';
import 'package:pscc/app/modules/preferences/preferences_view.dart';
import 'package:pscc/app/modules/solicitation/solicitation_view.dart';

class HomeController extends GetxController {
  final AuthService authService = Get.find();

  final RxInt current = 0.obs;

  StreamSubscription<ConnectivityResult> subscription;

  List<Widget> tabs = [
    DashboardView(),
    SolicitationView(),
    PreferencesView(),
  ];

  changeTab(i) => current.value = i;

  @override
  void onInit() {
    super.onInit();

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
}
