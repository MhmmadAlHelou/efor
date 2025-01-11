import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efor/controller/delivery/orders/accepted_controller.dart';
import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/get_decode_polyline.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/model/orders_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  MyServices myServices = Get.find();

  Timer? timer;

  StreamSubscription<Position>? positionStream;

  late OrdersModel ordersModel;

  GoogleMapController? gmc;

  CameraPosition? cameraPosition;

  List<Marker> markers = [];

  Set<Polyline> polylineSet = {};

  double? deslat;
  double? deslong;

  double? currentlat;
  double? currentlong;

  StatusRequest statusRequest = StatusRequest.success;

  DileveryOrdersAcceptedController ordersAcceptedController = Get.find();

  doneDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedController.doneDelivery(
      ordersModel.ordersId.toString(),
      ordersModel.ordersUsersid.toString(),
    );
    Get.offAllNamed(AppRoutes.homePage);
  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
      markerId: const MarkerId('dest'),
      position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
    ));

    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print('======= Current Position =======');
      print(position!.latitude);
      print(position.longitude);

      //
      currentlat = position.latitude;
      currentlong = position.longitude;
      //

      if (gmc != null) {
        gmc!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
      }

      markers.removeWhere((element) => element.markerId.value == 'current');
      markers.add(Marker(
        markerId: const MarkerId('current'),
        position: LatLng(position.latitude, position.longitude),
      ));
      update();
    });
  }

  initPolyline() async {
    deslat = ordersModel.addressLat;
    deslong = ordersModel.addressLong;

    await Future.delayed(const Duration(seconds: 1));
    polylineSet = await getPolyline(currentlat, currentlong, deslat, deslong);

    update();
  }

  refreshLocation() async {
    await Future.delayed(const Duration(seconds: 2));

    timer = Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        FirebaseFirestore.instance
            .collection('delivery')
            .doc(ordersModel.ordersId.toString())
            .set({
          'lat': currentlat.toString(),
          'long': currentlong.toString(),
          'deliveryid': myServices.sharedPreferences.get('id'),
        });
      },
    );
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initPolyline();
    getCurrentLocation();
    refreshLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    gmc!.dispose();
    timer!.cancel();
    super.onClose();
  }
}
