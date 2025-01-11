import 'package:efor/controller/favorite_controller.dart';
import 'package:efor/controller/offers_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/view/screen/home.dart';
import 'package:efor/view/widget/custom_appbar.dart';
import 'package:efor/view/widget/offers/custom_items_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteContoller());
    return GetBuilder<OffersController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(children: [
          CustomAppBar(
            myController: controller.search!,
            appbarTitle: 'Find Product',
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
            onPressedIconFavorite: () {
              Get.toNamed(AppRoutes.myFavorite);
            },
          ),
          const SizedBox(height: 20),
          controller.isSearch
              ? ListItemsSearch(listDataModel: controller.listData)
              : HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CustomListItemsOffers(
                      itemsModel: controller.data[index],
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
