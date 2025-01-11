import 'package:efor/controller/address/add_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Adress')),
      body: GetBuilder<AddAddressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              if (controller.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        onTap: (latLng) {
                          controller.addMarkers(latLng);
                        },
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.completerController!
                              .complete(controllerMap);
                        },
                      ),
                      Positioned(
                          bottom: 10,
                          child: MaterialButton(
                            onPressed: () {
                              controller.goToPageAddDetailsAddress();
                            },
                            minWidth: 200,
                            color: AppColor.primaryColor,
                            textColor: AppColor.white,
                            child: const Text(
                              'Contenu',
                              style: TextStyle(fontSize: 18),
                            ),
                          )),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
