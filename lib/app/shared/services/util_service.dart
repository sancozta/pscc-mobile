import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:share/share.dart';

class UtilService {
  static double stringRealToDouble(String val) {
    String valConvert = val.replaceAll('.', '').replaceAll(',', '.');
    return valConvert != '' ? double.parse(valConvert) : 0.0;
  }

  static String numToStr(double val) {
    if (val.isNaN || val == null) return '0.00';
    String valConvert = val.toStringAsFixed(2);
    return '$valConvert';
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

  static String getTextWordUpper(String strg) {
    if (strg == null) {
      return '';
    } else {
      String s = strg.toLowerCase();
      List<String> sa = s.split(' ');
      String sf = '';
      sa.forEach((x) {
        if (x.length > 1) {
          sf += '${x[0].toUpperCase()}${x.substring(1)} ';
        } else {
          sf += '${x[0].toUpperCase()} ';
        }
      });
      return sf.trim();
    }
  }

  static String getTextLimit(String strg, int limit) {
    if (strg == null) {
      return '';
    } else if (strg.length > limit) {
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
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static share(BuildContext context, String description) {
    final RenderBox box = context.findRenderObject();

    Share.share(
      description,
      subject: description,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  static getFcmServeKey() {
    const String FCM_SERVER_KEY =
        'key=AAAAg6_YaWc:APA91bGqeUv_CoQY0rfOAYyHAgKqgnR1gIohKtJzu0z7dL4wiCkrbbv3UjeKPJOgoXPMis6DoQmZD6Ln0tKFajoTWf8R0PRi41KzzWAjwIXmWTH5GKSe-R4HGcWqyjlmPvqM21hYPSfW';
    return FCM_SERVER_KEY;
  }

  static showMsg(String message) {
    return showToast(
      message,
      position: ToastPosition.bottom,
      backgroundColor: Colors.black45,
      textPadding: EdgeInsets.only(top: 6, bottom: 6, right: 8, left: 8),
      radius: 10.0,
      textStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      animationBuilder: Miui10AnimBuilder(),
    );
  }
}
