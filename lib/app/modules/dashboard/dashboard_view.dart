import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:pscc/app/shared/services/util_service.dart';
import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.green,
          icon: Icons.add,
          activeIcon: Icons.close,
          iconTheme: const IconThemeData(color: Colors.white),
          children: [
            SpeedDialChild(
              child: const Icon(
                Icons.attach_money_rounded,
                color: Colors.white,
              ),
              labelStyle: TextStyle(color: context.theme.primaryColor),
              backgroundColor: Colors.red,
              label: 'Despesa do Mês',
              onTap: () => controller.addCosts(context),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              ),
              labelStyle: TextStyle(color: context.theme.primaryColor),
              backgroundColor: Colors.blue,
              label: 'Objetivo de Compra',
              onTap: () => controller.addWishes(context),
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.people_alt_rounded,
                color: Colors.white,
              ),
              labelStyle: TextStyle(color: context.theme.primaryColor),
              backgroundColor: Colors.green,
              label: 'Dinheiro A Receber',
              onTap: () => controller.addReceivable(context),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                child: Column(
                  children: [
                    Obx(
                      () => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 6.0),
                                      child: Icon(Icons.emoji_people_rounded),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.authController.data.value.name?.toUpperCase() ?? '',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: context.theme.primaryColor,
                                          ),
                                        ),
                                        Text(
                                          controller.authController.data.value.email?.toUpperCase() ?? '',
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                            color: context.theme.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: InkWell(
                                        child: AnimatedRotation(
                                          turns: controller.turns.value,
                                          duration: const Duration(seconds: 2),
                                          curve: Curves.linear,
                                          child: const Icon(Icons.autorenew_sharp),
                                        ),
                                        onTap: () => controller.reloadData(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: InkWell(
                                        child: controller.dark.value
                                            ? const Icon(Icons.nights_stay)
                                            : const Icon(Icons.wb_sunny_rounded),
                                        onTap: () => controller.toogleTheme(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: InkWell(
                                        child: const Icon(Icons.logout),
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
                    Obx(
                      () => Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    UtilService.numToStrReal(controller.getCosts()),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
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
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Obx(
                      () => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Despesas",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: context.theme.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    UtilService.numToStrReal(controller.getCosts(), sufix: ''),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (controller.account.value.costs!.isEmpty)
                                const Text(
                                  'Nenhum Item Registrado...',
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              else
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.account.value.costs?.length ?? 0,
                                  itemBuilder: (_, i) => GestureDetector(
                                    onLongPress: () =>
                                        controller.deleteCosts(context, controller.account.value.costs![i]),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: SizedBox(
                                              height: 22,
                                              width: 22,
                                              child: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Colors.green,
                                                value: controller.account.value.costs![i].checked,
                                                onChanged: (v) {
                                                  controller.account.value.costs![i].checked = v;
                                                  controller.account.refresh();
                                                  controller.accounts.insert(controller.account.value);
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    controller.account.value.costs![i].label.toUpperCase(),
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(color: context.theme.primaryColor),
                                                  ),
                                                ),
                                                Text(
                                                  UtilService.numToStr(controller.account.value.costs![i].value),
                                                  style: TextStyle(color: context.theme.primaryColor),
                                                ),
                                              ],
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
                    ),
                    Obx(
                      () => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Objetivos",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: context.theme.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    UtilService.numToStrReal(controller.getWishes(), sufix: ''),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (controller.account.value.costs!.isEmpty)
                                const Text(
                                  'Nenhum Item Registrado...',
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              else
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.account.value.wishes?.length ?? 0,
                                  itemBuilder: (_, i) => GestureDetector(
                                    onLongPress: () =>
                                        controller.deleteWishes(context, controller.account.value.wishes![i]),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: SizedBox(
                                              height: 22,
                                              width: 22,
                                              child: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Colors.green,
                                                value: controller.account.value.wishes![i].checked,
                                                onChanged: (v) {
                                                  controller.account.value.wishes![i].checked = v;
                                                  controller.account.refresh();
                                                  controller.accounts.insert(controller.account.value);
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    controller.account.value.wishes![i].label.toUpperCase(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: context.theme.primaryColor),
                                                  ),
                                                ),
                                                Text(
                                                  UtilService.numToStr(controller.account.value.wishes![i].value),
                                                  style: TextStyle(color: context.theme.primaryColor),
                                                ),
                                              ],
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
                    ),
                    Obx(
                      () => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "A Receber",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: context.theme.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    UtilService.numToStrReal(controller.getReceivable(), sufix: ''),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (controller.account.value.costs!.isEmpty)
                                const Text(
                                  'Nenhum Item Registrado...',
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              else
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: controller.account.value.receivable?.length ?? 0,
                                  itemBuilder: (_, i) => GestureDetector(
                                    onLongPress: () =>
                                        controller.deleteReceivable(context, controller.account.value.receivable![i]),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: SizedBox(
                                              height: 22,
                                              width: 22,
                                              child: Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Colors.green,
                                                value: controller.account.value.receivable![i].checked,
                                                onChanged: (v) {
                                                  controller.account.value.receivable![i].checked = v;
                                                  controller.account.refresh();
                                                  controller.accounts.insert(controller.account.value);
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    controller.account.value.receivable![i].label.toUpperCase(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(color: context.theme.primaryColor),
                                                  ),
                                                ),
                                                Text(
                                                  UtilService.numToStr(controller.account.value.receivable![i].value),
                                                  style: TextStyle(color: context.theme.primaryColor),
                                                ),
                                              ],
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
