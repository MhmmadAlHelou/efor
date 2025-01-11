import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 30),
      color: AppColor.primaryColor,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        child: const Text('Continue'),
      ),
    );
  }
}
