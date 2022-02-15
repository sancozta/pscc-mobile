import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/shared/services/account_service.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<GetStorage>(() => GetStorage());
    Get.lazyPut<AccountService>(() => AccountService());
  }
}
