import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  const CardShippingAddressCheckout(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isActive});

  final String title;
  final String subtitle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title,
            style: isActive
                ? const TextStyle(
                    color: AppColor.white, fontWeight: FontWeight.bold)
                : null),
        subtitle: Text(subtitle,
            style: isActive
                ? const TextStyle(
                    color: AppColor.white, fontWeight: FontWeight.bold)
                : null),
      ),
    );
  }
}
