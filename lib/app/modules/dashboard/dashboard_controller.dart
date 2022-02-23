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
import 'package:pscc/app/shared/services/util_service.dart';

class DashboardController extends GetxController {
  final AuthController authController = Get.find();
  final AuthService authService = Get.find();
  final AccountService accounts = Get.find();
  final GetStorage storage = Get.find();

  get isPortrait => Get.context!.isPortrait;

  final Rx<Account> account = Rx(Account(costs: [], receivable: [], wishes: []));
  final RxBool dark = false.obs;
  final RxBool load = false.obs;
  RxDouble turns = 0.0.obs;

  final label = ''.obs;
  final value = ''.obs;

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    dark.value = Get.isDarkMode;
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult data) => authService.network = data == ConnectivityResult.none);
    load.value = true;
    Future.delayed(const Duration(milliseconds: 300)).then((value) => turns.value += 2.0);
    Future.delayed(const Duration(seconds: 2)).then((v) => reloadData());
    super.onInit();
  }

  reloadData() {
    load.value = true;
    accounts.selectById(authController.data.value.uid).then((data) {
      account.value = data;
      Future.delayed(const Duration(seconds: 2)).then((v) => load.value = false);
      turns.value += 2.0;
    });
  }

  @override
  void onClose() {
    subscription.cancel();
  }

  void logout() {
    authService.getLogout().then((value) => Get.offAndToNamed(Routes.login));
  }

  void toogleTheme() {
    dark.value = !dark.value;
    Get.changeThemeMode(dark.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future addItem(BuildContext _, String title, List<LabelValue> list) async {
    await Get.dialog(
      AlertDialog(
        titlePadding: const EdgeInsets.only(top: 20, bottom: 10, left: 14, right: 14),
        title: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, color: _.theme.primaryColor),
        ),
        contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 6),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: label.value,
                onChanged: (v) => label.value = v,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escreva algo...',
                  labelText: 'Descrição',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                initialValue: value.value,
                onChanged: (v) => value.value = v,
                style: const TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
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
                child: const Text('Cancelar'),
                onPressed: () {
                  cleanLabelValue();
                  Navigator.of(_).pop();
                },
              ),
              OutlinedButton(
                child: const Text('Adicionar', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  if (label.value.isNotEmpty && value.value.isNotEmpty) {
                    list.add(LabelValue(
                      label: label.value.toUpperCase(),
                      value: (0.0 + double.parse(value.value).toPrecision(2)),
                      checked: false,
                    ));
                    account.refresh();
                    printInfo(info: list.toString());
                    cleanLabelValue();
                    accounts.insert(account.value).then((r) {
                      printInfo(info: "Salvo com Sucesso => $r");
                      Navigator.of(_).pop();
                    });
                  } else {
                    UtilService.showMsg("Por favor preencher os campos para incluir!");
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void cleanLabelValue() {
    label.value = '';
    value.value = '';
  }

  Future addCosts(BuildContext _) async {
    account.value.costs = account.value.costs ?? [];
    await addItem(_, 'Despesa', account.value.costs ?? []);
    account.refresh();
  }

  Future addWishes(BuildContext _) async {
    account.value.wishes = account.value.wishes ?? [];
    await addItem(_, 'Objetivo de Compra', account.value.wishes ?? []);
    account.refresh();
  }

  Future addReceivable(BuildContext _) async {
    account.value.receivable = account.value.receivable ?? [];
    await addItem(_, 'Dinheiro a Receber', account.value.receivable ?? []);
    account.refresh();
  }

  Future deleteItem(BuildContext _, List<LabelValue> list, LabelValue item) async {
    await Get.dialog(
      AlertDialog(
        titlePadding: const EdgeInsets.only(top: 20, bottom: 10, left: 14, right: 14),
        title: Text(
          'Remover Item',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20, color: _.theme.primaryColor),
        ),
        contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 6),
        content: Text(
          "Deseja confirmar a exclusão do item ${item.label} ?",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14, color: _.theme.primaryColor),
        ),
        buttonPadding: const EdgeInsets.only(top: 0, left: 14, right: 14),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  cleanLabelValue();
                  Navigator.of(_).pop();
                },
              ),
              OutlinedButton(
                child: const Text('Remover', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)),
                onPressed: () {
                  list.removeAt(list.indexOf(item));
                  cleanLabelValue();
                  accounts.insert(account.value).then((r) {
                    printInfo(info: "Deletado com Sucesso => $r");
                    Navigator.of(_).pop();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future deleteCosts(BuildContext _, LabelValue item) async {
    account.value.costs = account.value.costs ?? [];
    await deleteItem(_, account.value.costs ?? [], item);
    account.refresh();
  }

  Future deleteWishes(BuildContext _, LabelValue item) async {
    account.value.wishes = account.value.wishes ?? [];
    await deleteItem(_, account.value.wishes ?? [], item);
    account.refresh();
  }

  Future deleteReceivable(BuildContext _, LabelValue item) async {
    account.value.receivable = account.value.receivable ?? [];
    await deleteItem(_, account.value.receivable ?? [], item);
    account.refresh();
  }

  double getList(List<LabelValue> list) {
    if (list.isEmpty) return 0.0;
    return list.map((v) => v.value).toList().reduce((value, element) => (value + element)).toPrecision(2);
  }

  double getCosts() {
    return getList(account.value.costs ?? []);
  }

  double getWishes() {
    return getList(account.value.wishes ?? []);
  }

  double getReceivable() {
    return getList(account.value.receivable ?? []);
  }
}
