import 'package:cached_network_image/cached_network_image.dart';
import 'package:efor/controller/home_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/data/model/itemsmodel.dart';
import 'package:efor/link_api.dart';
import 'package:efor/view/widget/custom_appbar.dart';
import 'package:efor/view/widget/home/custom_card_home.dart';
import 'package:efor/view/widget/home/custom_title_home.dart';
import 'package:efor/view/widget/home/list_categories_home.dart';
import 'package:efor/view/widget/home/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch
                  ? ListItemsSearch(listDataModel: controller.listData)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCardHome(
                          title: controller.bodyHomeCard,
                          body: controller.bodyHomeCard,
                        ),
                        const CustomTitleHome(title: 'Categories'),
                        const ListCategoriesHome(),
                        const CustomTitleHome(title: 'Top Selling'),
                        const ListItemsTopSelling(),
                        const CustomTitleHome(title: 'Discount'),
                        const ListItemsDiscount(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  const ListItemsSearch({super.key, required this.listDataModel});

  final List<ItemsModel> listDataModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDataModel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listDataModel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imageItems}/${listDataModel[index].categoriesName}/${listDataModel[index].itemsImage}")),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listDataModel[index].itemsName!),
                        subtitle: Text(listDataModel[index].categoriesName!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
