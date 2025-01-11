import 'package:efor/view/screen/delivery/orders/accepted.dart';
import 'package:efor/view/screen/delivery/orders/pending.dart';
import 'package:efor/view/screen/delivery/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class DeliveryHomeContoller extends GetxController {
  changePage(int i);
}

class DeliveryHomeContollerImp extends DeliveryHomeContoller {
  int currentPage = 0;

  List<Widget> listPage = [
    const DeliveryOrdersPending(),
    const DeliveryOrdersAccepted(),
    const DeliverySettingsPage(),
  ];

  List bottomAppBar = [
    {'title': 'Pending', 'icon': Icons.pending_actions},
    {'title': 'Accepted ', 'icon': Icons.check_circle_outline},
    {'title': 'Settings ', 'icon': Icons.settings},
  ];

  @override
  changePage(i) {
    currentPage = i;
    update();
  }
}
