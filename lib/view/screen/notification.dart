import 'package:efor/controller/notification_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  'Notification',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ...List.generate(
                controller.data.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Stack(
                    children: [
                      ListTile(
                        title:
                            Text(controller.data[index]['notification_title']),
                        subtitle:
                            Text(controller.data[index]['notification_body']),
                      ),
                      Positioned(
                        right: 5,
                        child: Text(
                          Jiffy(controller.data[index]['notification_datetime'],
                                  'yyyy-MM-dd')
                              .fromNow(),
                          style: const TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
