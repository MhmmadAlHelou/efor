import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/cart_data.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  intialData();
  addItems(int itemsId);
  deleteItems(int itemsId);
  getCountItems(int itemsId);
  add();
  remove();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());
  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  late ItemsModel itemsModel;
  late StatusRequest statusRequest;

  int countItems = 0;

  List subItems = [
    {'name': 'red', 'id': 1, 'active': 0},
    {'name': 'black', 'id': 2, 'active': 0},
    {'name': 'white', 'id': 3, 'active': 1},
  ];

  @override
  addItems(itemsId) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addCart(
        myServices.sharedPreferences.getString('id')!, itemsId.toString());
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: 'Add Cart', messageText: const Text('Done'));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  deleteItems(itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString('id')!, itemsId.toString());
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: 'Delete Cart', messageText: const Text('Done'));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  add() {
    if (countItems < itemsModel.itemsCount!) {
      addItems(itemsModel.itemsId!);
      countItems++;
      update();
    }
  }

  @override
  remove() {
    if (countItems > 0) {
      deleteItems(itemsModel.itemsId!);
      countItems--;
      update();
    }
  }

  @override
  getCountItems(itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
        myServices.sharedPreferences.getString('id')!, itemsId.toString());
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int countItems = 0;
        countItems = response['data'];
        print('=======================');
        print(countItems);
        return countItems;
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
  }

  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countItems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
