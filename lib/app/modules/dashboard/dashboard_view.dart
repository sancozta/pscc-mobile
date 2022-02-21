import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:pscc/app/shared/services/util_service.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.green,
          icon: Icons.add,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              child: Icon(Icons.attach_money_rounded),
              backgroundColor: Colors.red,
              label: 'Despesa do Mês',
              onTap: () => controller.addCosts(),
            ),
            SpeedDialChild(
              child: Icon(Icons.add_shopping_cart_rounded),
              backgroundColor: Colors.blue,
              label: 'Objetivo de Compra',
              onTap: () => controller.addWishes(),
            ),
            SpeedDialChild(
              child: Icon(Icons.people_alt_rounded),
              backgroundColor: Colors.green,
              label: 'Dinheiro A Receber',
              onTap: () => controller.addReceivable(),
            ),
          ],
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
                            controller.authController?.data?.value?.name?.toUpperCase() ?? '',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                          Text(
                            UtilService.numToStrReal(controller.getTotal()),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/budget.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
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
                          itemBuilder: (_, i) => GestureDetector(
                            onLongPress: () => controller.deleteCosts(),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      controller.account.value.costs[i].label.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    UtilService.numToStr(controller.account.value.costs[i].value),
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
              ),
              Obx(
                () => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lista de Desejo",
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
                          itemCount: controller.account.value.wishes?.length ?? 0,
                          itemBuilder: (_, i) => Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    controller.account.value.wishes[i].label.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  UtilService.numToStr(controller.account.value.wishes[i].value),
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
              Obx(
                () => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dinheiro A Receber",
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
                          itemCount: controller.account.value.receivable?.length ?? 0,
                          itemBuilder: (_, i) => Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    controller.account.value.receivable[i].label.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  UtilService.numToStr(controller.account.value.receivable[i].value),
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
