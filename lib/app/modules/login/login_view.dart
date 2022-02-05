import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pscc/app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 35,
              margin: EdgeInsets.only(bottom: 30, top: 75),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/star.png",
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55, right: 55),
              child: Text(
                "Estrutura Base Para Outros Aplicativos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75, right: 75, top: 20, bottom: 20),
              child: Text(
                "Funcionalidades padrão em aplicativos de pequeno e médio porte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                opacity: controller.opacityLevel.value,
                duration: Duration(
                  seconds: 3,
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 240,
                  margin: EdgeInsets.only(bottom: 40, top: 30),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/poeple.png",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.7,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(123, 228, 149, 1),
                      Color.fromRGBO(50, 157, 156, 1),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0.0, 1.5),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.authController.loginWithGoogle(),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75, right: 75, top: 20, bottom: 20),
              child: Text(
                "Continuar sem realizar login? Pular",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
