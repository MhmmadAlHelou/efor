import 'package:flutter/material.dart';

import '../../../core/constant/image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Image.asset(
        AppImageAsset.logo,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
