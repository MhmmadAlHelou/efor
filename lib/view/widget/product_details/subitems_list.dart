import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class SubItemsList extends StatelessWidget {
// class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({
    super.key,
    required this.text,
    required this.borderColor,
    required this.textColor,
  });

  final Color borderColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    // ProductDetailsControllerImp controller =
    //     Get.put(ProductDetailsControllerImp());
    return Row(
      children: [
        // ...List.generate(
        // controller.subItems.length,
        // length,
        // (index) =>
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 5),
          height: 60,
          width: 90,
          decoration: BoxDecoration(
            color: borderColor,
            // controller.subItems[index]['active'] == 1
            //     ? AppColor.grey2
            //     : AppColor.white,
            border: Border.all(color: AppColor.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            // controller.subItems[index]['name'],
            style: TextStyle(
                color: textColor,
                // controller.subItems[index]['active'] == 1
                //     ? AppColor.white
                //     : AppColor.grey2,
                fontWeight: FontWeight.bold),
          ),
        ),
        // ),
      ],
    );
  }
}
