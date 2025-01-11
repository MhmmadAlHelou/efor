import 'package:cached_network_image/cached_network_image.dart';
import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
class TopPageProductDetails extends StatelessWidget {
  const TopPageProductDetails(
      {super.key, required this.tag, required this.imageUrl});

  final Object tag;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // ProductDetailsControllerImp controller =
    //     Get.put(ProductDetailsControllerImp());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
            // borderRadius:
            //     BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        Positioned(
          top: 30,
          right: Get.width / 20,
          left: Get.width / 20,
          child: Hero(
            // tag: controller.itemsModel.itemsId!,
            tag: tag,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              // "${AppLink.imageItems}/${controller.itemsModel.categoriesName}/${controller.itemsModel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
