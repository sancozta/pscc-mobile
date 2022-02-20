import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pscc/app/app.dart';
import 'package:pscc/app/shared/services/account_service.dart';

import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/shared/services/handler_error_service.dart';
import 'package:pscc/app/shared/services/messaging_service.dart';
import 'package:pscc/app/shared/services/util_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp().then((init) async {
    await GetStorage.init();

    Get.put<GetStorage>(GetStorage(), permanent: true);
    Get.put<HandlerErrorService>(HandlerErrorService(), permanent: true);
    Get.put<AuthService>(AuthService(), permanent: true);
    Get.put<UtilService>(UtilService(), permanent: true);
    Get.put<MessagingService>(MessagingService(), permanent: true);
    Get.put<AccountService>(AccountService(), permanent: true);

    Get.changeThemeMode(Get.find<GetStorage>().read<bool>('dark') == true ? ThemeMode.dark : ThemeMode.light);

    runApp(App());
  });
}
