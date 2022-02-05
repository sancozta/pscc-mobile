import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/controllers/auth_binding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      animationCurve: Curves.easeIn,
      animationBuilder: Miui10AnimBuilder(),
      animationDuration: Duration(milliseconds: 200),
      duration: Duration(seconds: 4),
      child: GetMaterialApp(
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Application',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages().routes,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
      ),
    );
  }
}
