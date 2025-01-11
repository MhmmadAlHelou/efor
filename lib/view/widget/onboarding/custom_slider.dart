import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/utils/size_config.dart';
import '../../../data/data_sourse/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Stack(
        children: [
          Image.asset(
            onBoardingList[index].image!,
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            fit: BoxFit.fitHeight,
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth! / 2,
              color: Theme.of(context).shadowColor,
            ),
          ),
          Positioned(
            left: SizeConfig.screenWidth! * 0.04,
            top: SizeConfig.defaultSize! * 30,
            child: Text(
              onBoardingList[index].title!,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Positioned(
            left: SizeConfig.screenWidth! * 0.04,
            top: SizeConfig.defaultSize! * 35,
            child: Text(
              onBoardingList[index].body!,
              //  textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
