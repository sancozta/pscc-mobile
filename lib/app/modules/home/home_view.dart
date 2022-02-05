import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pscc/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Obx(
                () => controller.tabs[controller.current.value],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.green[300],
          buttonBackgroundColor: Colors.green[300],
          index: controller.current.value,
          onTap: (indexOfClickedTab) => controller.changeTab(indexOfClickedTab),
          animationDuration: Duration(milliseconds: 230),
          height: 55,
          items: [
            Icon(
              Icons.search_rounded,
            ),
            Icon(
              Icons.local_shipping_rounded,
            ),
            Icon(
              Icons.emoji_people_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
