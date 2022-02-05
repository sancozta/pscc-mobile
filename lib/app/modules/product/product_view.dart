import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pscc/app/shared/services/util_service.dart';
import 'product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => (controller.product.value == null || controller.product.value.uid == null)
            ? Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  elevation: 0,
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 8, left: 8),
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        String link = controller.getLink(controller.product.value.uid);
                        UtilService.share(Get.context, link);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 15, left: 8),
                        child: Icon(
                          Icons.share_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 25,
                            left: 25,
                            top: 5,
                            bottom: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Obx(
                                  () => CarouselSlider(
                                    options: CarouselOptions(
                                      autoPlay: false,
                                      aspectRatio: 2.0,
                                      enlargeCenterPage: true,
                                      onPageChanged: (i, reason) {
                                        controller.current.value = i;
                                      },
                                    ),
                                    items: controller.convertListInWidgets(controller.product.value.images),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: controller.convertListInWidgetsDot(
                                    controller.product.value.images,
                                    controller.current.value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        constraints: BoxConstraints(
                          minHeight: Get.height - 305,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: Colors.green[100],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => Text(
                                              controller.product.value.title,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Obx(
                                            () => Text(
                                              controller.product.value.category,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0,
                                          color: Colors.blueGrey[200],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      width: 115,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.blueGrey,
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
                                                color: Colors.blueGrey,
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
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => Text(
                                        UtilService.doubleToStringReal(controller.product.value.price),
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.shopping_cart_rounded,
                                            color: Colors.blueGrey,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Comprar',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  'Informações do Produto',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Obx(
                                  () => Text(
                                    controller.product.value.description,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueGrey,
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
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
    );
  }
}
