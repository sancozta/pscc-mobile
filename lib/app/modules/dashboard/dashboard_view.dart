import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pscc/app/shared/services/util_service.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.navigation,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.authController?.data?.value?.name ?? ' ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: controller.dark.value ? Icon(Icons.nights_stay) : Icon(Icons.wb_sunny_rounded),
                                onTap: () => controller.toogleTheme(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: InkWell(
                                  child: Icon(Icons.logout),
                                  onTap: () => controller.logout(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gestão de Gastos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$ 99.999,00',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.logout(),
                            child: FlutterLogo(
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Despesas",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.account.value.costs?.length ?? 0,
                          itemBuilder: (_, i) => Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.account.value.costs[i].label),
                                Text(
                                  UtilService.numToStr(controller.account.value.costs[i].value),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
