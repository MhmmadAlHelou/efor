import 'package:efor/controller/cart_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:efor/view/widget/cart/custom_items_cart_list.dart';
import 'package:efor/view/widget/cart/top_card_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text('My Cart')),
        bottomNavigationBar: BottomNavigationBarCart(
          price: '${controller.priceOrders} \$',
          discount: '${controller.couponDiscount}%',
          shipping: '300 \$',
          totalPrice: '${controller.getTotalPrice() + 300} \$',
          controllerCoupon: controller.controllerCoupon,
          onApplyCoupon: () {
            controller.checkCoupon();
          },
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(height: 10),
              TopCardCart(
                  message:
                      'You have ${controller.totalCountItems} Items in Your List'),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      controller.data.length,
                      (index) => CustomItemsCartList(
                        onAdd: () async {
                          if (controller.data[index].countitems! <
                              controller.data[index].itemsCount!) {
                            await controller
                                .add(controller.data[index].itemsId!);
                            controller.refreshPage();
                          }
                        },
                        onRemove: () async {
                          if (controller.data[index].countitems! > 0) {
                            await controller
                                .delete(controller.data[index].itemsId!);
                            controller.refreshPage();
                          }
                        },
                        name: controller.data[index].itemsName!,
                        imageName:
                            "${controller.data[index].itemsCat! == 1 ? 'men' : controller.data[index].itemsCat! == 2 ? 'women' : 'kids'}/${controller.data[index].itemsImage!}",
                        price: '${controller.data[index].itemsprice} \$',
                        count: '${controller.data[index].countitems}',
                      ),
                    )
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
