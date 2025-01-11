import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/data/data_sourse/remote/auth/verfiycode_signup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  reSend();
  goToSeccessSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;

  VerfiycodeSignUpData verfiycodeSignUpData = VerfiycodeSignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSeccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiycodeSignUpData.potData(email!, verificationCode);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.seccessSignUp);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verify Code is note correct",
        );
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  reSend() {
    verfiycodeSignUpData.resendData(email!);
  }
}
