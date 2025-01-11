import 'package:efor/controller/favorite_product_details_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/link_api.dart';
import 'package:efor/view/widget/product_details/price_and_count.dart';
import 'package:efor/view/widget/product_details/subitems_list.dart';
import 'package:efor/view/widget/product_details/top_page_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteProductDetails extends StatelessWidget {
  const FavoriteProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteProductDetailsControllerImp controller =
        Get.put(FavoriteProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {},
          child: const Text(
            'Add To Card',
            style:
                TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          // const TopFavoritePageProductDetails(),
          TopPageProductDetails(
            tag: controller.myFavoriteModel.itemsId!,
            imageUrl:
                "${AppLink.imageItems}/${controller.myFavoriteModel.itemsCat == 1 ? "men" : controller.myFavoriteModel.itemsCat == 2 ? "women" : "kids"}/${controller.myFavoriteModel.itemsImage}",
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${controller.myFavoriteModel.itemsName}',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColor.white,
                        )),
                const SizedBox(height: 10),
                PriceAndCoune(
                  onAdd: () {},
                  onRemove: () {},
                  price: controller.myFavoriteModel.itemsPrice.toString(),
                  count: controller.myFavoriteModel.itemsCount.toString(),
                ),
                const SizedBox(height: 10),
                Text('${controller.myFavoriteModel.itemsDesc}',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 10),
                Text('Colors',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppColor.white,
                        )),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ...List.generate(
                      controller.subItems.length,
                      (index) => SubItemsList(
                        text: controller.subItems[index]['name'],
                        borderColor: controller.subItems[index]['active'] == 1
                            ? AppColor.grey2
                            : AppColor.white,
                        textColor: controller.subItems[index]['active'] == 1
                            ? AppColor.white
                            : AppColor.grey2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
