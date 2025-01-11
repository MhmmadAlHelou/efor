import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteContoller extends GetxController {
  Map isFavorite = {};

  MyServices myServices = Get.find();

  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString('id')!, itemsId);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: 'Add Favorite', messageText: const Text('Done'));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
  }

  removeFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString('id')!, itemsId);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'Remove Favorite', messageText: const Text('Done'));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
  }
}
