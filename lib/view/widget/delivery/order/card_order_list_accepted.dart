import 'package:efor/controller/delivery/orders/accepted_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class DeliveryCardOrdersListAccepted
    extends GetView<DileveryOrdersAcceptedController> {
  const DeliveryCardOrdersListAccepted({super.key, required this.ordersModel});

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order Number: ${ordersModel.ordersId}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                // Text(ordersModel.ordersDatetime!),
                Text(
                  Jiffy(ordersModel.ordersDatetime!, 'yyyy-MM-dd').fromNow(),
                  style: const TextStyle(
                      color: AppColor.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text('Order Price: ${ordersModel.ordersPrice} \$'),
            Text('Delivery price: ${ordersModel.ordersPricedelivery} \$'),
            Text(
                'Payment Method: ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod.toString())}'),
            const Divider(),
            Row(
              children: [
                Text(
                  'Total price: ${ordersModel.ordersTotalprice}',
                  style: const TextStyle(
                      color: AppColor.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (ordersModel.ordersStatus == 3)
                  MaterialButton(
                    onPressed: () {
                      controller.doneDelivery(
                        ordersModel.ordersId!.toString(),
                        ordersModel.ordersUsersid!.toString(),
                      );
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.white,
                    child: const Text('Done'),
                  ),
                const SizedBox(width: 10),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.deliveryOrdersDetails,
                        arguments: {'ordersmodel': ordersModel});
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.white,
                  child: const Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
