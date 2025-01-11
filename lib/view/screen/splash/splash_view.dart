import 'package:efor/view/widget/splash/splash_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xf0000000),
      body: SplashBody(),
    );
  }
}
