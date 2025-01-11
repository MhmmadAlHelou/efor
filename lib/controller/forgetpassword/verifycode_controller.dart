import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/data/data_sourse/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  reSend();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;

  VerifycodePasswordData verifycodePasswordData =
      VerifycodePasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodePasswordData.potData(email!, verifycode);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetPassword, arguments: {'email': email});
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
    verifycodePasswordData.resendData(email!);
  }
}
