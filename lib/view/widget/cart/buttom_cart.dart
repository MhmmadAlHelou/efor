import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key, required this.textButtom, this.onPressed});

  final String textButtom;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(
          textButtom,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
