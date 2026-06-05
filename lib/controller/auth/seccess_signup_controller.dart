import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SeccessSignUpController extends GetxController {
  dynamic goToPageLogin();
}

class SeccessSignUpControllerImp extends SeccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
