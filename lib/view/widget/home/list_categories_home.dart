import 'package:efor/controller/home_controller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/functions/translate_database.dart';
import 'package:efor/data/model/categoriesmodel.dart';
import 'package:efor/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

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

class Categories extends GetView<HomeControllerImp> {
  const Categories({super.key, required this.categoriesModel, required this.i});

  final CategoriesModel categoriesModel;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              '${AppLink.imageCategories}/${categoriesModel.categoriesImage}',
              // color: AppColor.secondColor,
            ),
          ),
          Text(
            '${translateDatabase(categoriesModel.categoriesName, categoriesModel.categoriesNameAr)}',
            style: const TextStyle(fontSize: 15, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
