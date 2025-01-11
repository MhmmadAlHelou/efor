import 'package:efor/controller/product_details_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/link_api.dart';
import 'package:efor/view/widget/product_details/price_and_count.dart';
import 'package:efor/view/widget/product_details/top_page_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductDetailsControllerImp controller =
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {
            Get.toNamed(AppRoutes.cart);
          },
          child: const Text(
            'Go To Card',
            style:
                TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              TopPageProductDetails(
                  tag: controller.itemsModel.itemsId!,
                  imageUrl:
                      "${AppLink.imageItems}/${controller.itemsModel.itemsCat == 1 ? 'men' : controller.itemsModel.itemsCat == 2 ? 'women' : 'kids'}/${controller.itemsModel.itemsImage}"),
              // "${AppLink.imageItems}/${controller.itemsModel.categoriesName}/${controller.itemsModel.itemsImage}"),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${controller.itemsModel.itemsName}',
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppColor.white,
                                )),
                    const SizedBox(height: 10),
                    PriceAndCoune(
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                      price: (controller.itemsModel.itemsPrice! -
                              (controller.itemsModel.itemsPrice! *
                                  controller.itemsModel.itemsDiscount! /
                                  100))
                          .toString(),
                      // controller.itemsModel.itemsPriceDiscount.toString(),
                      count: controller.countItems.toString(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        '${controller.itemsModel.itemsDesc} \nThe Total quantity is ${controller.itemsModel.itemsCount}',
                        style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 10),
                    // Text('Colors',
                    //     style:
                    //         Theme.of(context).textTheme.headlineLarge?.copyWith(
                    //               color: AppColor.white,
                    //             )),
                    // const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     ...List.generate(
                    //       controller.subItems.length,
                    //       (index) => SubItemsList(
                    //         text: controller.subItems[index]['name'],
                    //         borderColor:
                    //             controller.subItems[index]['active'] == 1
                    //                 ? AppColor.grey2
                    //                 : AppColor.white,
                    //         textColor: controller.subItems[index]['active'] == 1
                    //             ? AppColor.white
                    //             : AppColor.grey2,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
