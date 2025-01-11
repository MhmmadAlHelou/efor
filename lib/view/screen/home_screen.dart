import 'dart:io';

import 'package:efor/controller/home_screen_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/view/widget/home/custom_bottom_appbar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenContollerImp());
    return GetBuilder<HomeScreenContollerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          backgroundColor: AppColor.backGroundColor,
          foregroundColor: AppColor.white,
          shape: const CircleBorder(),
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: const Icon(Icons.shopping_cart_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
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
