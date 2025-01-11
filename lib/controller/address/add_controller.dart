import 'dart:async';

import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completerController;

  Position? position;
  CameraPosition? kGooglePlex;

  List<Marker> markers = [];

  double lat = 0.0;
  double long = 0.0;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(
      AppRoutes.addressAddDetails,
      arguments: {
        "lat": lat.toString(),
        "long": long.toString(),
      },
    );
  }

  @override
  void onInit() {
    getCurrentPosition();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );

    lat = position!.latitude;
    long = position!.longitude;

    addMarkers(LatLng(position!.latitude, position!.longitude));

    statusRequest = StatusRequest.none;
    update();
  }
}
