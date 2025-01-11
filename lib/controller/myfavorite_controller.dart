import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/myfavorite_data.dart';
import 'package:efor/data/model/myfavorite.dart';
import 'package:get/get.dart';

class MyFavoriteContoller extends GetxController {
  MyServices myServices = Get.find();

  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print('Data');
        print(data);
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteFromFavorite(int favoriteId) {
    favoriteData.deleteData(favoriteId);
    data.removeWhere((element) => element.favoriteId == favoriteId);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  goTofavoriteProductDetails(MyFavoriteModel myFavoriteModel) {
    Get.toNamed('vaforiteproductdetails',
        arguments: {'myFavoriteModel': myFavoriteModel});
  }
}
