import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/localization/change_local.dart';
import '../../widget/language/custom_buttom_lang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1'.tr, style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
            CustomButtomLang(
              textButtom: 'Ar',
              onPressed: () {
                controller.changeLang('ar');
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            CustomButtomLang(
              textButtom: 'En',
              onPressed: () {
                controller.changeLang('en');
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
