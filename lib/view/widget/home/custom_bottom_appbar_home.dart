import 'package:efor/controller/home_screen_controller.dart';
import 'package:efor/view/widget/home/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenContollerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              controller.listPage.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        onPressed: () {
                          controller.changePage(i);
                        },
                        text: controller.bottomAppBar[i]['title'],
                        iconData: controller.bottomAppBar[i]['icon'],
                        active: controller.currentPage == i ? true : false,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
