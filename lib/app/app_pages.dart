import 'package:get/get.dart';

import 'package:pscc/app/modules/adresses/adresses_binding.dart';
import 'package:pscc/app/modules/adresses/adresses_view.dart';

import 'package:pscc/app/modules/home/home_binding.dart';
import 'package:pscc/app/modules/home/home_view.dart';

import 'package:pscc/app/modules/login/login_binding.dart';
import 'package:pscc/app/modules/login/login_view.dart';

import 'package:pscc/app/modules/notifications/notifications_binding.dart';
import 'package:pscc/app/modules/notifications/notifications_view.dart';

import 'package:pscc/app/modules/payments/payments_binding.dart';
import 'package:pscc/app/modules/payments/payments_view.dart';

import 'package:pscc/app/modules/personal/personal_binding.dart';
import 'package:pscc/app/modules/personal/personal_view.dart';

import 'package:pscc/app/modules/preferences/preferences_binding.dart';
import 'package:pscc/app/modules/preferences/preferences_view.dart';

import 'package:pscc/app/modules/product/product_binding.dart';
import 'package:pscc/app/modules/product/product_view.dart';

import 'package:pscc/app/modules/shopping/shopping_binding.dart';
import 'package:pscc/app/modules/shopping/shopping_view.dart';

import 'package:pscc/app/shared/services/auth_service.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;
  List<GetPage> routes;

  AppPages() {
    final AuthService auth = Get.find();

    routes = [
      GetPage(
        name: _Paths.LOGIN,
        page: () => auth.getUserFire() == null ? LoginView() : HomeView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
        ],
      ),
      GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
        ],
      ),
      GetPage(
        name: _Paths.SHOPPING,
        page: () => ShoppingView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          ShoppingBinding(),
        ],
      ),
      GetPage(
        name: _Paths.PRODUCT,
        page: () => ProductView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          ProductBinding(),
        ],
      ),
      GetPage(
        name: _Paths.PREFERENCES,
        page: () => PreferencesView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          PreferencesBinding(),
        ],
      ),
      GetPage(
        name: _Paths.PERSONAL,
        page: () => PersonalView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          PersonalBinding(),
        ],
      ),
      GetPage(
        name: _Paths.NOTIFICATIONS,
        page: () => NotificationsView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          NotificationsBinding(),
        ],
      ),
      GetPage(
        name: _Paths.ADRESSES,
        page: () => AdressesView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          AdressesBinding(),
        ],
      ),
      GetPage(
        name: _Paths.PAYMENTS,
        page: () => PaymentsView(),
        bindings: [
          HomeBinding(),
          LoginBinding(),
          PaymentsBinding(),
        ],
      ),
    ];
  }
}
