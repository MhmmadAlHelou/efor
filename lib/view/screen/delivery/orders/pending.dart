import 'package:efor/controller/delivery/orders/pending_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/view/widget/delivery/order/card_order_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOrdersPending extends StatelessWidget {
  const DeliveryOrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryOrdersPendingController());
    return GetBuilder<DeliveryOrdersPendingController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context, index) =>
              DeliveryCardOrdersList(ordersModel: controller.data[index]),
        ),
      ),
    );
  }
}
