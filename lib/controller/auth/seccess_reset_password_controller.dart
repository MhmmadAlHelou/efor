import 'package:efor/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SeccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SeccessResetPasswordControllerImp extends SeccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
