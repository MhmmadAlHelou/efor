import 'package:efor/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../core/functions/alert_exit_app.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custom_buttom_auth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_form_auyh.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/logo_auth.dart';
import '../../widget/auth/text_signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   //  backgroundColor: AppColor.black,
      //   elevation: 0.0,
      //   title: LogoAuth(),
      //   // Text(
      //   //   'Sign In',
      //   //   style: Theme.of(context)
      //   //       .textTheme
      //   //       .displayLarge!
      //   //       .copyWith(color: AppColor.grey),
      //   // ),
      // ),
      body: WillPopScope(
        onWillPop: alertExetApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    // Text(
                    //   'Sign In',
                    //   textAlign: TextAlign.center,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .displayLarge!
                    //       .copyWith(color: AppColor.grey),
                    // ),
                    const CustomTextTitleAuth(text: 'Welcome Back'),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        text:
                            'Sign In With Your Email And Password OR Continue With Social Media'),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 100, 'email');
                        },
                        myController: controller.email,
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomTextFormAuth(
                          obscureText: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 30, 'password');
                          },
                          myController: controller.password,
                          hintText: 'Enter Your Password',
                          labelText: 'Password',
                          iconData: Icons.lock_outlined,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: const Text('Forget Password',
                            textAlign: TextAlign.end),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomButtomAuth(
                        text: 'Sign In',
                        onPressed: () {
                          controller.login();
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextSignUporSignIn(
                      text1: "Don't have an account?  ",
                      text2: 'SignUp',
                      onTap: () {
                        controller.goToSignUp();
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
