import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/constant/color.dart';
import '../../core/utils/size_config.dart';
import '../widget/onboarding/dot_controller.dart';
import '../widget/onboarding/custom_button.dart';
import '../widget/onboarding/custom_slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Stack(
          children: [
            const CustomSliderOnBoarding(),
            Positioned(
              left: SizeConfig.defaultSize! * 3,
              //  right: SizeConfig.defaultSize! * 2,
              bottom: SizeConfig.defaultSize! * 15,
              child: const CustomDotControllerOnBoarding(),
            ),
            //  VerticalSpace(5),
            Positioned(
              left: SizeConfig.defaultSize! * 5,
              right: SizeConfig.defaultSize! * 5,
              bottom: SizeConfig.defaultSize! * 4,
              child: const CustomButtonOnBoarding(),
            )
          ],
        ),
      ),
    );
  }
}
