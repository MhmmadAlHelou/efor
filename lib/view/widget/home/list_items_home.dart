import 'package:efor/controller/home_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:efor/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsTopSelling extends GetView<HomeControllerImp> {
  const ListItemsTopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.itemsTop.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.itemsTop[index]),
          );
        },
      ),
    );
  }
}

class ListItemsDiscount extends GetView<HomeControllerImp> {
  const ListItemsDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.itemsDis.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.itemsDis[index]),
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  const ItemsHome({super.key, required this.itemsModel});

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 200,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child:
                //  Hero(
                //   tag: itemsModel.itemsId!,
                //   child:
                Image.network(
              '${AppLink.imageItems}/${itemsModel.itemsCat == 1 ? 'men' : itemsModel.itemsCat == 2 ? 'women' : 'kids'}/${itemsModel.itemsImage}',
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          // ),
          Positioned(
            left: 10,
            child: Text(
              '${itemsModel.itemsName}',
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
