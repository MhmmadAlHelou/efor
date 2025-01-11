import 'package:efor/controller/delivery/home_screen_controller.dart';
import 'package:efor/view/widget/delivery/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryCustomBottomAppBarHome extends StatelessWidget {
  const DeliveryCustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryHomeContollerImp>(
      builder: (controller) => BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              // controller.listPage.length + 1,
              controller.listPage.length,
              (index) {
                // int i = index > 2 ? index - 1 : index;
                return DeliveryCustomButtonAppBar(
                  onPressed: () {
                    controller.changePage(index);
                    // controller.changePage(i);
                  },
                  text: controller.bottomAppBar[index]['title'],
                  iconData: controller.bottomAppBar[index]['icon'],
                  active: controller.currentPage == index ? true : false,
                  // text: controller.bottomAppBar[i]['title'],
                  // iconData: controller.bottomAppBar[i]['icon'],
                  // active: controller.currentPage == i ? true : false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
