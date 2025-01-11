import 'package:efor/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_buttom_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_form_auyh.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/text_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          'SignUp',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExetApp,
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const CustomTextTitleAuth(text: 'Welcome '),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        text:
                            'SignUp With Your Email And Password OR Continue With Social Media'),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 20, 'username');
                      },
                      myController: controller.username,
                      hintText: 'Enter Your Username',
                      labelText: 'Username',
                      iconData: Icons.person_outline,
                    ),
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
                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 7, 11, 'phone');
                      },
                      myController: controller.phone,
                      hintText: 'Enter Your Phone number',
                      labelText: 'Phone',
                      iconData: Icons.phone_android_outlined,
                    ),
                    CustomTextFormAuth(
                      obscureText: true,
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 3, 30, "password");
                      },
                      myController: controller.password,
                      hintText: 'Enter Your Password',
                      labelText: 'Password',
                      iconData: Icons.lock_outlined,
                    ),
                    CustomButtomAuth(
                      text: 'SignUp',
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(height: 30),
                    CustomTextSignUporSignIn(
                      text1: "Have an account?  ",
                      text2: 'SignIn',
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
