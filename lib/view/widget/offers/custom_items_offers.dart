import 'package:cached_network_image/cached_network_image.dart';
import 'package:efor/controller/favorite_controller.dart';
import 'package:efor/controller/offers_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/image_assets.dart';
import 'package:efor/core/functions/translate_database.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:efor/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
// class CustomListItemsOffers extends GetView<ItemsControllerImp> {
  const CustomListItemsOffers({super.key, required this.itemsModel});

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    // Get.put(ItemsControllerImp());
    Get.put(OffersController());
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: itemsModel.itemsId!,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppLink.imageItems}/${itemsModel.categoriesName}/${itemsModel.itemsImage}',
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translateDatabase(
                        itemsModel.itemsName, itemsModel.itemsNameAr),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   // crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     const Text("Rating 3.5"),
                  //     ...List.generate(
                  //         5, (index) => const Icon(Icons.star, size: 10))
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${itemsModel.itemsPriceDiscount!}\$',
                        style: const TextStyle(
                            color: AppColor.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sans'),
                      ),
                      GetBuilder<FavoriteContoller>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemsId] ==
                                  1) {
                                controller.setFavorite(itemsModel.itemsId, 0);
                                controller.removeFavorite(
                                    itemsModel.itemsId.toString());
                              } else {
                                controller.setFavorite(itemsModel.itemsId, 1);
                                controller
                                    .addFavorite(itemsModel.itemsId.toString());
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemsId] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.white,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != 0)
              Positioned(
                top: 4,
                left: 4,
                child: Image.asset(AppImageAsset.sale, width: 40),
              ),
          ],
        ),
      ),
    );
  }
}
