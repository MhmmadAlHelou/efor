import 'package:efor/controller/home_controller.dart';
import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/items_data.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends SearchMixController {
  intialData();
  changeCat(int i, int catval);
  getItems(int categoryId);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  int? catId;

  String delivryTime = '';

  MyServices myServices = Get.find();

  ItemsData itemsData = ItemsData(Get.find());

  List data = [];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    delivryTime = myServices.sharedPreferences.getString('deliverytime')!;
    search = TextEditingController();
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catId = Get.arguments['catid'];
    getItems(catId!);
  }

  @override
  changeCat(i, catval) {
    selectedCat = i;
    catId = catval;
    getItems(catId!);
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryId, myServices.sharedPreferences.getString('id')!);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed('productdetails', arguments: {'itemsmodel': itemsModel});
  }
}
