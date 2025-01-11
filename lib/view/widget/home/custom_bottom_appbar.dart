import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  const CustomButtonAppBar({
    super.key,
    this.onPressed,
    required this.text,
    required this.iconData,
    required this.active,
  });

  final void Function()? onPressed;
  final String text;
  final IconData iconData;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: active == true ? AppColor.white : AppColor.grey,
              size: active == true ? 35 : 25,
            ),
          ],
        ),
      ),
    );
  }
}
