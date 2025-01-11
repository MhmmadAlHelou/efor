import 'package:efor/controller/items_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/functions/translate_database.dart';
import 'package:efor/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 50),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories({super.key, required this.categoriesModel, required this.i});

  final CategoriesModel categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 3, color: AppColor.white)),
                    )
                  : null,
              child: Text(
                '${translateDatabase(categoriesModel.categoriesName, categoriesModel.categoriesNameAr)}',
                style: const TextStyle(fontSize: 20, color: AppColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
