import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/cart_data.dart';
import 'package:efor/data/model/cart_model.dart';
import 'package:efor/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  List<CartModel> data = [];

  CouponModel? couponModel;

  int couponDiscount = 0;
  String? couponName;
  String? couponId;

  TextEditingController? controllerCoupon;

  double priceOrders = 0;
  int totalCountItems = 0;

  add(int itemsId) async {
    // if (countItems < data.itemsCount!)
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

  delete(int itemsId) async {
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

  resetVarCart() {
    priceOrders = 0;
    totalCountItems = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString('id')!);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == 'success') {
          data.clear();
          List responseData = response['datacart']['data'];
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));

          Map responseCountPrice = response['countprice'];
          totalCountItems = responseCountPrice['totalcount'];
          priceOrders = responseCountPrice['totalprice'];

          // totalCountItems = int.parse(responseCountPrice['totalcount']);
          // priceOrders = double.parse(responseCountPrice['totalprice']);
        }
        statusRequest = StatusRequest.none;
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  getTotalPrice() {
    return priceOrders - priceOrders * couponDiscount / 100;
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        couponDiscount = couponModel!.couponDiscount!;
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        couponDiscount = 0;
        couponName = null;
        couponId = null;
        Get.snackbar('Warning', 'The Coupon is not valid');
      }
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) {
      Get.snackbar('Warning', 'The Cart is empty');
    } else {
      Get.toNamed(
        AppRoutes.checkout,
        arguments: {
          'couponid': couponId ?? '0',
          'priceorder': priceOrders.toString(),
          'couponDiscount': couponDiscount.toString(),
        },
      );
    }
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    super.onInit();
  }
}
