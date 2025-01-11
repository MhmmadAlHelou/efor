import 'package:efor/controller/delivery/orders/accepted_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/view/widget/delivery/order/card_order_list_accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrdersAccepted extends StatelessWidget {
  const DeliveryOrdersAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DileveryOrdersAcceptedController());
    return GetBuilder<DileveryOrdersAcceptedController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) => DeliveryCardOrdersListAccepted(
              ordersModel: controller.data[index]),
        ),
      ),
    );
  }
}
