import 'package:efor/controller/favorite_controller.dart';
import 'package:efor/controller/items_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:efor/view/screen/home.dart';
import 'package:efor/view/widget/custom_appbar.dart';
import 'package:efor/view/widget/items/custom_list_items.dart';
import 'package:efor/view/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controllerImp = Get.put(ItemsControllerImp());
    FavoriteContoller contollerFav = Get.put(FavoriteContoller());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              myController: controllerImp.search!,
              appbarTitle: 'Find Product',
              onPressedSearch: () {
                controllerImp.onSearchItems();
              },
              onChanged: (val) {
                controllerImp.checkSearch(val);
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoutes.myFavorite);
              },
            ),
            const SizedBox(height: 20),
            const ListCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controllerImp.isSearch
                    ? ListItemsSearch(listDataModel: controller.listData)
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.5,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          contollerFav.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
