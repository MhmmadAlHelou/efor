import 'dart:async';

import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/data/data_sourse/remote/orders/details_data.dart';
import 'package:efor/data/model/cart_model.dart';
import 'package:efor/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersModel? ordersModel;

  Completer<GoogleMapController>? completerController;

  CameraPosition? cameraPosition;

  List<Marker> markers = [];

  // double? lat;
  // double? long;

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];
  late StatusRequest statusRequest;

  intialData() {
    if (ordersModel!.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(ordersModel!.addressLat!, ordersModel!.addressLong!),
        zoom: 12.4746,
      );
      markers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(ordersModel!.addressLat!, ordersModel!.addressLong!),
      ));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersModel!.ordersId!.toString());
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }
}
