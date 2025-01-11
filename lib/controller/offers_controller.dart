import 'package:efor/controller/home_controller.dart';
import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/data/data_sourse/remote/offers_data.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handling_data_controller.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listDataa = response['data'];
        data.addAll(listDataa.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.toNamed('productdetails', arguments: {'itemsmodel': itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
