import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'shopping_controller.dart';

class ShoppingView extends GetView<ShoppingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          onPressed: () {},
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text('Carrinho de Compras'),
          backgroundColor: Colors.green[300],
          elevation: 1,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: Get.height / 250,
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  children: List.generate(25, (i) {
                    return Container(
                      child: Card(
                        elevation: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/product.png"),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    width: 80,
                                    height: double.infinity,
                                    padding: EdgeInsets.all(15),
                                  ),
                                  Container(
                                    width: 150,
                                    alignment: AlignmentDirectional.topStart,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            "Lorem Ipsum é simplesmente uma simulação de texto da indústria",
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Text(
                                            "R\$ 999,99",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    height: double.infinity,
                                    padding: EdgeInsets.all(15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "999",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
