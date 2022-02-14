import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pscc/app/modules/dashboard/dashboard_view.dart';
import 'package:pscc/app/shared/controllers/auth_controller.dart';
import 'package:pscc/app/shared/controllers/auth_enum.dart';
import 'package:pscc/app/app_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final AuthController auth = Get.find();

    if (auth.status.value == AuthEnum.LOGIN) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else if (auth.status.value == AuthEnum.LOGOFF) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/doctor.png',
      nextScreen: DashboardView(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.scale,
    );
  }
}
