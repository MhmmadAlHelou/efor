import 'package:efor/controller/orders/archive_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRatingDialog(BuildContext context, int orderId) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title: const Text(
        'Rat The Order',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
      ),
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      image: const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 75,
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
      commentHint: 'Set your custom comment hint',
      onSubmitted: (response) {
        OrdersArchiveController controller = Get.find();
        controller.submitRating(
            orderId.toString(), response.rating, response.comment);
      },
    ),
  );
}
