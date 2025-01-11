import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  const CardDeliveryTypeCheckout(
      {super.key,
      required this.isActive,
      required this.imageName,
      required this.title,
      required this.size});

  final bool isActive;
  final String imageName;
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive ? AppColor.secondColor : null,
          border: Border.all(color: AppColor.secondColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName,
              width: size, color: isActive ? AppColor.white : null),
          Text(
            title,
            style: TextStyle(
              color: AppColor.white,
              fontWeight: isActive ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
