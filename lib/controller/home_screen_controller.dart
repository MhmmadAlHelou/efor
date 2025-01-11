import 'package:efor/view/screen/home.dart';
import 'package:efor/view/screen/notification.dart';
import 'package:efor/view/screen/offers.dart';
import 'package:efor/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenContoller extends GetxController {
  changePage(int i);
}

class HomeScreenContollerImp extends HomeScreenContoller {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationView(),
    const OffersView(),
    const SettingsPage(),
  ];

  List bottomAppBar = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Notifications', 'icon': Icons.notifications_active_outlined},
    {'title': 'Offers', 'icon': Icons.local_offer_outlined},
    {'title': 'Settings', 'icon': Icons.settings},
  ];

  @override
  changePage(i) {
    currentPage = i;
    update();
  }
}
