import 'package:efor/core/functions/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_theme.dart';
import '../services/services.dart';
import 'package:geolocator/geolocator.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);

    myServices.sharedPreferences.setString('lang', langCode);

    appTheme = langCode == 'ar' ? themeArbic : themeEnglish;

    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "Please Turn on Your Location");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Warning", "Please Turn on Your Location  ");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("Warning",
          "You Can Not Use The Application Without Your Location Permission");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();

    requestPerLocation();

    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');

    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArbic;
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }

    super.onInit();
  }
}
