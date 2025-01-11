import 'package:efor/controller/myfavorite_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/view/widget/myfavorite/custom_list_favorite_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteContoller());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteContoller>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   appbarTitle: 'Find Product',
              //   onPressedSearch: () {},
              //   onPressedIconFavorite: () {
              //     // Get.toNamed(AppRoutes.myFavorite);
              //   },
              // ),
              const SizedBox(height: 20),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                        myFavoriteModel: controller.data[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
