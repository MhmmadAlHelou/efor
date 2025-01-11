import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/seccess_signup_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custom_buttom_auth.dart';

class SeccessSignUp extends StatelessWidget {
  const SeccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SeccessSignUpControllerImp controller =
        Get.put(SeccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          'Seccess',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              'Congratulations',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 30),
            ),
            const Text('Successfully Registered'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: 'Go to Login',
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
