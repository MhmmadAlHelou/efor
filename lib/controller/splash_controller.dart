import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/language/language.dart';

abstract class SplshController extends GetxController {
  goToNextView();
}

class SplshControllerImp extends SplshController {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  SingleTickerProviderStateMixin? singleTickerProviderStateMixin;
  TickerProvider? tickerProvider;

  @override
  void onInit() {
    // tickerProvider = TickerProvider();
    // animationController = AnimationController(
    //   vsync: tickerProvider.,
    //   duration: const Duration(milliseconds: 900),
    // );
    fadingAnimation =
        Tween<double>(begin: 0.1, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);

    goToNextView();
    super.onInit();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  goToNextView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(() => const Language(), transition: Transition.fade);
      },
    );
  }
}
