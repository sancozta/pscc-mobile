import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pscc/app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.only(bottom: 30, top: 75),
              decoration: const BoxDecoration(
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
                "Gerenciamento de Gastos e Objetivos Financeiros",
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
                "Organize suas despesas, seus desejos de compra e o dinheiro que você tem a receber",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 240,
              margin: const EdgeInsets.only(bottom: 40, top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/login.png",
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.7,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(123, 228, 149, 1),
                      Color.fromRGBO(50, 157, 156, 1),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 158, 158, 158),
                      offset: Offset(0.0, 1.5),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.authController.loginWithGoogle(),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
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
          ],
        ),
      ),
    );
  }
}
