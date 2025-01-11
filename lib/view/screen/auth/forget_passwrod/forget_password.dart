import 'package:efor/controller/forgetpassword/forget_password_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../widget/auth/custom_buttom_auth.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_form_auyh.dart';
import '../../../widget/auth/custom_text_title_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          'Forget Password',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formstate,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(
                children: [
                  const CustomTextTitleAuth(text: 'Check Email'),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text:
                          'Please Enter Your Email Address To Recive A verification code'),
                  const SizedBox(height: 15),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, 'email');
                    },
                    myController: controller.email,
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    iconData: Icons.email_outlined,
                  ),
                  CustomButtomAuth(
                    text: 'Check',
                    onPressed: () {
                      controller.checkEmail();
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
