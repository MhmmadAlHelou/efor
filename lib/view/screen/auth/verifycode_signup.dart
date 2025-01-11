import 'package:efor/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verufycode_signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          'Verification Code',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const CustomTextTitleAuth(text: 'Check Code'),
                const SizedBox(height: 10),
                CustomTextBodyAuth(
                    text:
                        'Please Enter The Digit Code Sent To ${controller.email}'),
                const SizedBox(height: 15),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: AppColor.primaryColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.goToSeccessSignUp(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    controller.reSend();
                  },
                  child: const Center(
                      child: Text(
                    'Resend Verify Code',
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
