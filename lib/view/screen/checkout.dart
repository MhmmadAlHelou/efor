import 'package:efor/controller/checkout_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/image_assets.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/view/widget/checkout/card_delivery_type.dart';
import 'package:efor/view/widget/checkout/card_payment_method.dart';
import 'package:efor/view/widget/checkout/card_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          color: AppColor.secondColor,
          textColor: AppColor.white,
          onPressed: () {
            controller.checkout();
          },
          child: const Text('Checkout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const Text(
                  'Choose Payment Method',
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod('0');
                  },
                  child: CardPaymentMethodCheckout(
                    title: 'Cash On Delivery',
                    isActive: controller.paymentMethod == '0' ? true : false,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethod('1');
                  },
                  child: CardPaymentMethodCheckout(
                    title: 'Payment Cards',
                    isActive: controller.paymentMethod == '1' ? true : false,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Choose Delivery Type',
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType('0');
                      },
                      child: CardDeliveryTypeCheckout(
                        isActive: controller.deliveryType == '0' ? true : false,
                        imageName: AppImageAsset.delivery,
                        title: 'Delivery',
                        size: 60,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType('1');
                      },
                      child: CardDeliveryTypeCheckout(
                        isActive: controller.deliveryType == '1' ? true : false,
                        imageName: AppImageAsset.driveThru,
                        title: 'Drive Thru',
                        size: 60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (controller.deliveryType == '0')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.dataAddress.isNotEmpty)
                        const Text(
                          'Shipping Address',
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      const SizedBox(height: 10),
                      if (controller.dataAddress.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.addressAdd);
                          },
                          child: const Center(
                              child: Text(
                            'Please Click Here To Add Shipping Address',
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ...List.generate(
                        controller.dataAddress.length,
                        (index) => InkWell(
                          onTap: () {
                            controller.chooseShoppingAddress(controller
                                .dataAddress[index].addressId
                                .toString());
                          },
                          child: CardShippingAddressCheckout(
                            title:
                                '${controller.dataAddress[index].addressName}',
                            subtitle:
                                '${controller.dataAddress[index].addressCity}: ${controller.dataAddress[index].addressStreet}',
                            isActive: controller.addressId ==
                                    controller.dataAddress[index].addressId
                                        .toString()
                                ? true
                                : false,
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
