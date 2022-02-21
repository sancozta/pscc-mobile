import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/controllers/auth_controller.dart';
import 'package:pscc/app/shared/models/account.dart';
import 'package:pscc/app/shared/services/auth_service.dart';
import 'package:pscc/app/shared/services/account_service.dart';

class DashboardController extends GetxController {
  final AuthController authController = Get.find();
  final AuthService authService = Get.find();
  final AccountService accounts = Get.find();
  final GetStorage storage = Get.find();

  get isPortrait => Get.context.isPortrait;

  final Rx<Account> account = Rx(Account());
  final RxBool dark = false.obs;

  final label = TextEditingController();
  final value = TextEditingController();

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    dark.value = Get.isDarkMode;
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult data) => this.authService.network = data == ConnectivityResult.none);
    accounts.selectById(authController.data.value.uid).then((data) => account.value = data);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
  }

  void logout() {
    authService.getLogout();
    Get.offAndToNamed(Routes.LOGIN);
  }

  void toogleTheme() {
    this.dark.value = !this.dark.value;
    Get.changeThemeMode(this.dark.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future addCosts() async {
    await Get.dialog(
      AlertDialog(
        titlePadding: const EdgeInsets.only(top: 20, bottom: 10, left: 14, right: 14),
        title: Text(
          'Adicionar Despesa',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
        contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 6),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: label,
                onChanged: (v) => label.text = v,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escreva algo...',
                  labelText: 'Descrição',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: value,
                onChanged: (v) => value.text = v,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite o Valor...',
                  labelText: 'Valor',
                ),
              ),
            ],
          ),
        ),
        buttonPadding: const EdgeInsets.only(top: 0, left: 14, right: 14),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(Get.context).pop(),
              ),
              OutlinedButton(
                child: Text('Adicionar'),
                onPressed: () {
                  account.value.costs.add(LabelValue(label: label.text, value: 0.0 + double.parse(value.text)));
                  cleanLabelValue();
                  Navigator.of(Get.context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addWishes() {}

  void addReceivable() {}

  void cleanLabelValue() {
    label.text = '';
    value.text = '';
  }

  Future deleteCosts() async {
    await Get.dialog(
      AlertDialog(
        titlePadding: const EdgeInsets.only(top: 20, bottom: 10, left: 14, right: 14),
        title: Text(
          'Deletar Despesa',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
        contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 6),
        content: Text(
          'Gerar texto do item selecionado...',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14),
        ),
        buttonPadding: const EdgeInsets.only(top: 0, left: 14, right: 14),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(Get.context).pop(),
              ),
              OutlinedButton(
                child: Text('Adicionar'),
                onPressed: () {
                  account.value.costs.add(LabelValue(label: label.text, value: 0.0 + double.parse(value.text)));
                  cleanLabelValue();
                  Navigator.of(Get.context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  double getTotal() {
    if (account.value.costs == null || account.value.costs.length == 0) return 0.0;
    return account.value.costs.map((v) => v.value).toList().reduce((value, element) => (value + element));
  }
}
