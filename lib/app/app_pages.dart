import 'package:get/get.dart';

import 'package:pscc/app/modules/dashboard/dashboard_binding.dart';
import 'package:pscc/app/modules/dashboard/dashboard_view.dart';

import 'package:pscc/app/modules/login/login_binding.dart';
import 'package:pscc/app/modules/login/login_view.dart';

import 'package:pscc/app/shared/services/auth_service.dart';

part 'app_routes.dart';

class AppPages {
  static getRoutes() {
    final AuthService auth = Get.find();

    List<GetPage> routes = [
      GetPage(
        name: Routes.login,
        page: () => auth.getUserFire() == null ? const LoginView() : const DashboardView(),
        bindings: [
          DashboardBinding(),
          LoginBinding(),
        ],
      ),
      GetPage(
        name: Routes.home,
        page: () => const DashboardView(),
        bindings: [
          DashboardBinding(),
          LoginBinding(),
        ],
      ),
    ];

    return routes;
  }
}
