import 'package:efor/data/model/myfavorite.dart';
import 'package:get/get.dart';

abstract class FavoriteProductDetailsController extends GetxController {
  intialData();
}

class FavoriteProductDetailsControllerImp
    extends FavoriteProductDetailsController {
  late MyFavoriteModel myFavoriteModel;

  List subItems = [
    {'name': 'red', 'id': 1, 'active': 0},
    {'name': 'black', 'id': 2, 'active': 0},
    {'name': 'white', 'id': 3, 'active': 1},
  ];

  @override
  intialData() {
    myFavoriteModel = Get.arguments['myFavoriteModel'];
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
