import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/home_data.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeContoller extends SearchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, int categoryid);
  goToProductDetails(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeContoller {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  String titleHomeCard = '';
  String bodyHomeCard = '';
  String delivryTime = '';

  List categories = [];
  List itemsDis = [];
  List itemsTop = [];
  List settings = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
    lang = myServices.sharedPreferences.getString('lang');
  }

  @override
  void onInit() {
    search = TextEditingController();
    FirebaseMessaging.instance.subscribeToTopic('users');
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']['data']);
        itemsDis.addAll(response['itemsdis']['data']);
        itemsTop.addAll(response['itemstop']['data']);
        settings.addAll(response['settings']['data']);

        titleHomeCard = settings[0]['settings_titlehome'];
        bodyHomeCard = settings[0]['settings_bodyhome'];
        delivryTime = settings[0]['settings_deliverytime'].toString();

        myServices.sharedPreferences.setString('deliverytime', delivryTime);
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        'categories': categories,
        'selectedcat': selectedCat,
        'catid': categoryid,
      },
    );
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed('productdetails', arguments: {'itemsmodel': itemsModel});
  }
}

class SearchMixController extends GetxController {
  late StatusRequest statusRequest;

  TextEditingController? search;

  bool isSearch = false;

  List<ItemsModel> listData = [];

  HomeData homeData = HomeData(Get.find());

  checkSearch(val) {
    if (val == '') {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        listData.clear();
        List responsedaata = response['data'];
        listData.addAll(responsedaata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }
}
