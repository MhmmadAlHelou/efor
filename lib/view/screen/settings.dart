import 'package:efor/controller/settings_conttroller.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/core/constant/image_assets.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsConttroller conttroller = Get.put(SettingsConttroller());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(height: Get.height / 4, color: AppColor.primaryColor),
            Positioned(
                top: Get.height / 5.4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.grey,
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ListTile(
                //   title: const Text('Disable Notifications'),
                //   trailing: Switch(
                //     value: true,
                //     onChanged: (value) {},
                //   ),
                // ),
                // const Divider(),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.addressView);
                  },
                  title: const Text('Address'),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersPending);
                  },
                  title: const Text('Orders'),
                  trailing: const Icon(Icons.card_travel),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.ordersArchive);
                  },
                  title: const Text('Archive'),
                  trailing: const Icon(Icons.card_travel),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text('About us'),
                  trailing: const Icon(Icons.help_outline_rounded),
                ),
                // const Divider(),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse('tel:+963956350244'));
                  },
                  title: const Text('Contact us'),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                // const Divider(),
                ListTile(
                  onTap: () {
                    conttroller.logout();
                  },
                  title: const Text('Logout'),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
