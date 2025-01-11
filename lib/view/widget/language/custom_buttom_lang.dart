import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtomLang extends StatelessWidget {
  const CustomButtomLang({super.key, required this.textButtom, this.onPressed});

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
