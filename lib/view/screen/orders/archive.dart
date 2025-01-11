import 'package:efor/controller/orders/archive_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/view/widget/order/card_order_list_archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchice extends StatelessWidget {
  const OrdersArchice({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive Orders'),
      ),
      body: GetBuilder<OrdersArchiveController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) =>
                CardOrdersListArchive(ordersModel: controller.data[index]),
          ),
        ),
      ),
    );
  }
}
