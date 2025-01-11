import 'package:efor/controller/delivery/orders/detail_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryOrdersDetails extends StatelessWidget {
  const DeliveryOrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryOrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<DeliveryOrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            const TableRow(children: [
                              Text(
                                'Type',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'QTY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Price',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                      Text(controller.data[index].itemsName!,
                                          textAlign: TextAlign.center),
                                      Text(
                                          '${controller.data[index].countitems!}',
                                          textAlign: TextAlign.center),
                                      Text(
                                          '${controller.data[index].itemsPrice!}',
                                          textAlign: TextAlign.center),
                                    ])),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Total Price: ${controller.ordersModel!.ordersTotalprice}\$',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //////////////////
                if (controller.ordersModel!.ordersType == 0)
                  Card(
                    child: ListTile(
                      title: const Text(
                        'Shipping Address',
                        style: TextStyle(
                            color: AppColor.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          '${controller.ordersModel!.addressCity} ${controller.ordersModel!.addressStreet}'),
                    ),
                  ),
                if (controller.ordersModel!.ordersType == 0)
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.completerController
                              .complete(controllerMap);
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                if (controller.ordersModel!.ordersType == 0 &&
                    controller.ordersModel!.ordersStatus == 3)
                  CustomButtom(
                    text: 'Trackin',
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersTracking,
                          arguments: {'ordersmodel': controller.ordersModel});
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
