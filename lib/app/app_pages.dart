import 'package:get/get.dart';

import 'package:pscc/app/modules/dashboard/dashboard_binding.dart';
import 'package:pscc/app/modules/dashboard/dashboard_view.dart';

import 'package:pscc/app/modules/login/login_binding.dart';
import 'package:pscc/app/modules/login/login_view.dart';

import 'package:pscc/app/shared/services/auth_service.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;
  List<GetPage> routes;

  AppPages() {
    final AuthService auth = Get.find();

    routes = [
      GetPage(
        name: Routes.LOGIN,
        page: () => auth.getUserFire() == null ? LoginView() : DashboardView(),
        bindings: [
          DashboardBinding(),
          LoginBinding(),
        ],
      ),
      GetPage(
        name: Routes.HOME,
        page: () => DashboardView(),
        bindings: [
          DashboardBinding(),
          LoginBinding(),
        ],
      ),
    ];
  }
}
