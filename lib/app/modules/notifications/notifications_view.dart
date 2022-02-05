import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notificações'),
          backgroundColor: Colors.green[300],
          elevation: 1,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.notifications_active_rounded,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Obx(
                    () => SwitchListTile(
                      onChanged: (bool b) => controller.v1.value = b,
                      value: controller.v1.value,
                      title: Text(
                        "Promoções",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Receber Informações Sobre Promoções",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Obx(
                    () => SwitchListTile(
                      onChanged: (bool b) => controller.v3.value = b,
                      value: controller.v3.value,
                      title: Text(
                        "Pedidos",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Mudanças de Status de Pedidos",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
