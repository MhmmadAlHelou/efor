import 'package:efor/controller/orders/archive_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/data/model/orders_model.dart';
import 'package:efor/view/widget/order/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  const CardOrdersListArchive({super.key, required this.ordersModel});

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
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
                'Order Type: ${controller.printOrderType(ordersModel.ordersType.toString())}'),
            Text('Order Price: ${ordersModel.ordersPrice} \$'),
            Text('Delivery price: ${ordersModel.ordersPricedelivery} \$'),
            Text(
                'Payment Method: ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod.toString())}'),
            Text(
                'Order Status: ${controller.printOrderStatus(ordersModel.ordersStatus.toString())}'),
            const Divider(),
            Row(
              children: [
                Text(
                  'Total price: ${ordersModel.ordersTotalprice}',
                  style: const TextStyle(
                      color: AppColor.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (ordersModel.ordersRating == 0)
                  MaterialButton(
                    onPressed: () {
                      showRatingDialog(context, ordersModel.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text('Rating'),
                  ),
                const SizedBox(width: 10),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.ordersDetails,
                        arguments: {'ordersmodel': ordersModel});
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
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
