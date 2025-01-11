import 'package:efor/controller/cart_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/view/widget/cart/buttom_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttom_coupon copy.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  const BottomNavigationBarCart({
    super.key,
    required this.price,
    required this.discount,
    required this.totalPrice,
    this.controllerCoupon,
    required this.onApplyCoupon,
    required this.shipping,
  });

  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController? controllerCoupon;
  final Function() onApplyCoupon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
          builder: (controller) => controller.couponName == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: controllerCoupon,
                          decoration: const InputDecoration(
                            hintText: 'Coupon Code',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 1,
                        child: CustomButtonCoupon(
                          textButtom: 'Apply',
                          onPressed: onApplyCoupon,
                        ),
                      ),
                    ],
                  ),
                )
              : Text(
                  'Coupon Code: ${controller.couponName!}',
                  style: const TextStyle(
                      color: AppColor.white, fontWeight: FontWeight.bold),
                ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Price', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(price, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Discount', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(discount, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Shipping', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(shipping, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Total Price',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(totalPrice,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white)),
                ),
              ],
            ),
          ]),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textButtom: 'Order',
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    );
  }
}
