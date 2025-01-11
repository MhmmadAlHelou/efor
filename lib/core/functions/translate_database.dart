import 'package:efor/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnEn, columnAr) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString('lang') == 'ar') {
    return columnAr;
  } else {
    return columnEn;
  }
}
