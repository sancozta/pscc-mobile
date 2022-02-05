import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pscc/app/app_pages.dart';
import 'package:pscc/app/shared/models/product.dart';
import 'package:pscc/app/shared/services/util_service.dart';
import 'package:qrscan/qrscan.dart' as qr;

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
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
                  Text(
                    'Conheça as Novidades',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Todos os produtos entregues em qualquer lugar do brasil com frete grátis',
                    style: TextStyle(
                      color: Colors.green[400],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Colors.blueGrey[900],
                              ),
                              margin: EdgeInsets.only(top: 15, right: 15),
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Lojas Físicas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Colors.green[800],
                              ),
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.all(5),
                              child: Container(
                                child: Text(
                                  'Visualizar Perfil',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          String txt = await qr.scan();
                          if (txt != null && txt.isNotEmpty) {
                            UtilService.showMsg(txt);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(
                            Icons.qr_code_rounded,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SHOPPING);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(
                            Icons.shopping_cart_rounded,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: GridView.builder(
                primary: false,
                padding: EdgeInsets.all(10),
                itemCount: controller.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: controller.isPortrait ? 2 : 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: Get.height / 920,
                ),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Card(
                    elevation: 1,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT, arguments: controller.list[i].uid);
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  Product.getPresentation(controller.list[i].images),
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4),
                              ),
                            ),
                            width: double.infinity,
                            height: 120,
                            padding: EdgeInsets.all(15),
                          ),
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 6, right: 6, top: 6),
                              child: Text(
                                controller.list[i].title,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                UtilService.doubleToStringReal(controller.list[i].price),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
