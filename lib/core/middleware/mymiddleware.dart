import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      if (myServices.sharedPreferences.getString('type') == 'client') {
        return const RouteSettings(name: AppRoutes.homePage);
      } else if (myServices.sharedPreferences.getString('type') == 'delivery') {
        return const RouteSettings(name: AppRoutes.deliveryHome);
      }
    }
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
