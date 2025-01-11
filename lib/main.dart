import 'package:efor/bindings/initialbinding.dart';
import 'package:efor/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const EFOR());
}

class EFOR extends StatelessWidget {
  const EFOR({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    //SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: controller.appTheme,
      //   home: const SplashView(),
      getPages: routes,
      initialBinding: InitialBinding(),
    );
  }
}
