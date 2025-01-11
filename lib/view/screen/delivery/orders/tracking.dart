import 'package:efor/controller/delivery/tracking_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TrackingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    // height: 300,
                    width: double.infinity,
                    child: GoogleMap(
                      polylines: controller.polylineSet,
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllerMap) {
                        controller.gmc = controllerMap;
                      },
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    controller.doneDelivery();
                  },
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  minWidth: 300,
                  height: 30, //
                  color: AppColor.primaryColor,
                  textColor: AppColor.white,
                  child: const Text('The Order Has Been Deliverd'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
