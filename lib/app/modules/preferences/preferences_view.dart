import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pscc/app/app_pages.dart';

import 'preferences_controller.dart';

class PreferencesView extends GetView<PreferencesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.green[100],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.green[800],
                              image: DecorationImage(
                                image: AssetImage("assets/avatar.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(15),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Text(
                                    controller.authController.data.value.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.authController.data.value.email,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Obx(
                        () => InkWell(
                          child: controller.dark.value ? Icon(Icons.nights_stay) : Icon(Icons.wb_sunny_rounded),
                          onTap: () => controller.toogleTheme(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.room_preferences,
                    size: 34,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.PERSONAL);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  title: Text(
                    "Meus dados",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Minhas informações da conta",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.notifications_active,
                    size: 34,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATIONS);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  title: Text(
                    "Notificações",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Minha central de notificações",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    size: 34,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.ADRESSES);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  title: Text(
                    "Endereços",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Meus endereços de Entrega",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.credit_card_outlined,
                    size: 34,
                  ),
                  onTap: () {
                    Get.toNamed(Routes.PAYMENTS);
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  title: Text(
                    "Formas de Pagamento",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Minhas formas de pagamento",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    size: 34,
                  ),
                  onTap: () {
                    controller.logout();
                  },
                  title: Text(
                    "Sair",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Realizar logoff da conta",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
