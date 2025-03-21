import 'package:efor/controller/home_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  const CustomCardHome({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              subtitle: Text(body,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
          Positioned(
            top: -20,
            right: controller.lang == 'en' ? -40 : null,
            left: controller.lang == 'ar' ? -40 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.secondColor,
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
