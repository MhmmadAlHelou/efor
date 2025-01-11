import 'dart:io';

import 'package:efor/controller/delivery/home_screen_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/view/widget/delivery/custom_bottom_appbar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryHome extends StatelessWidget {
  const DeliveryHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryHomeContollerImp());
    return GetBuilder<DeliveryHomeContollerImp>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: const DeliveryCustomBottomAppBarHome(),
        body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                title: 'Attention!',
                titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.white),
                middleText: 'Do you want to exit from the app?',
                cancelTextColor: AppColor.secondColor,
                confirmTextColor: AppColor.secondColor,
                buttonColor: AppColor.thirdColor,
                onCancel: () {},
                onConfirm: () {
                  exit(0);
                },
              );
              return Future.value(false);
            },
            child: controller.listPage.elementAt(controller.currentPage)),
      ),
    );
  }
}
