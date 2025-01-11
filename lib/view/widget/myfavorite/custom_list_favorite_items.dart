import 'package:cached_network_image/cached_network_image.dart';
import 'package:efor/controller/myfavorite_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/functions/translate_database.dart';
import 'package:efor/data/model/myfavorite.dart';
import 'package:efor/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteContoller> {
  const CustomListFavoriteItems({super.key, required this.myFavoriteModel});

  final MyFavoriteModel myFavoriteModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hero(
            //   tag: myFavoriteModel.itemsId!,
            // child:
            InkWell(
              onTap: () {
                controller.goTofavoriteProductDetails(myFavoriteModel);
              },
              child: CachedNetworkImage(
                imageUrl: myFavoriteModel.itemsCat == 1
                    ? '${AppLink.imageItems}/men/${myFavoriteModel.itemsImage}'
                    : myFavoriteModel.itemsCat == 2
                        ? '${AppLink.imageItems}/women/${myFavoriteModel.itemsImage}'
                        : '${AppLink.imageItems}/kids/${myFavoriteModel.itemsImage}',
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            // ),
            const SizedBox(height: 10),
            Text(
              translateDatabase(
                  myFavoriteModel.itemsName, myFavoriteModel.itemsNameAr),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rating 3.5"),
                ...List.generate(5, (index) => const Icon(Icons.star, size: 10))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${myFavoriteModel.itemsPrice.toString()}\$',
                  style: const TextStyle(
                      color: AppColor.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'sans'),
                ),
                IconButton(
                  onPressed: () {
                    controller.deleteFromFavorite(myFavoriteModel.favoriteId!);
                  },
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    color: AppColor.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
