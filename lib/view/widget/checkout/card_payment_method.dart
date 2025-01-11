import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  const CardPaymentMethodCheckout(
      {super.key, required this.title, required this.isActive});

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.secondColor : AppColor.thirdColor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.white,
          // color: isActive == true ? AppColor.white : AppColor.secondColor,
          height: 1,
          fontWeight: isActive ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
