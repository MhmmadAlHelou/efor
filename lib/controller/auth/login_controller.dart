import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.potData(email.text, password.text);
      print("===================connn $response");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setString('id', response['data']['users_id'].toString());
            String userid = myServices.sharedPreferences.getString('id')!;
            myServices.sharedPreferences
                .setString('username', response['data']['users_name']);
            myServices.sharedPreferences
                .setString('email', response['data']['users_email']);
            myServices.sharedPreferences
                .setString('phone', response['data']['users_phone']);
            myServices.sharedPreferences
                .setString('type', response['data']['users_type']);
            myServices.sharedPreferences.setString('step', '2');

            if (myServices.sharedPreferences.getString('type') == 'client') {
              FirebaseMessaging.instance.subscribeToTopic('users');
              FirebaseMessaging.instance.subscribeToTopic('users$userid');
              Get.offNamed(AppRoutes.homePage);
            } else if (myServices.sharedPreferences.getString('type') ==
                'delivery') {
              FirebaseMessaging.instance.subscribeToTopic('delivery');
              FirebaseMessaging.instance.subscribeToTopic('delivery$userid');
              Get.offNamed(AppRoutes.deliveryHome);
            }
          } else {
            Get.offNamed(
              AppRoutes.verfiyCodeSignUp,
              arguments: {'email': email.text},
            );
          }
        } else {
          Get.defaultDialog(
            title: "Warning",
            middleText: "Email or Password not correct",
          );
          statusRequest = StatusRequest.faillure;
        }
      }
      update();
    } else {
      print('Not Valid');
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
