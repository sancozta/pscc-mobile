import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

class UtilService {
  static double stringRealToDouble(String val) {
    String valConvert = val.replaceAll('.', '').replaceAll(',', '.');
    return valConvert != '' ? double.parse(valConvert) : 0.0;
  }

  static String numToStr(double val) {
    if (val.isNaN) return '0.00';
    String valConvert = val.toStringAsFixed(2);
    return valConvert;
  }

  static String numToStrReal(double val, {String sufix = 'R\$'}) {
    if (val.isNaN) return '$sufix 0.00';
    String valConvert = val.toStringAsFixed(2);
    return '$sufix $valConvert';
  }

  static double doublePrecisionTwo(double val) {
    String step1 = val.toStringAsFixed(2);
    return double.parse(step1);
  }

  static String dateFormatString(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(date);
    return formatted;
  }

  static String dateFormatStringDtHr(DateTime date) {
    DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    String formatted = formatter.format(date);
    return formatted;
  }

  static bool isGreaterThanZero(double val) {
    return val > 0 ? true : false;
  }

  static String getTextLimit(String strg, int limit) {
    if (strg.length > limit) {
      return '${strg.substring(0, limit)}...';
    } else {
      return strg;
    }
  }

  static bool isValueEmailValid(String value) {
    return RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    ).hasMatch(value);
  }

  static showAlertDialogInternet(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            description,
          ),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static getFcmServeKey() {
    return 'key=AAAAg6_YaWc:APA91bGqeUv_CoQY0rfOAYyHAgKqgnR1gIohKtJzu0z7dL4wiCkrbbv3UjeKPJOgoXPMis6DoQmZD6Ln0tKFajoTWf8R0PRi41KzzWAjwIXmWTH5GKSe-R4HGcWqyjlmPvqM21hYPSfW';
  }

  static showMsg(String message) {
    return showToast(
      message,
      position: ToastPosition.bottom,
      backgroundColor: Colors.black45,
      textPadding: const EdgeInsets.only(top: 6, bottom: 6, right: 8, left: 8),
      radius: 10.0,
      textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      animationBuilder: const Miui10AnimBuilder(),
    );
  }
}
