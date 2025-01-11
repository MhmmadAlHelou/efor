import 'package:efor/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/image_assets.dart';
import '../../screen/language/language.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    fadingAnimation =
        Tween<double>(begin: 0.1, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenHeight,
      child: FadeTransition(
        opacity: fadingAnimation!,
        child: Image.asset(
          AppImageAsset.splash,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(() => const Language(), transition: Transition.fade);
      },
    );
  }
}
