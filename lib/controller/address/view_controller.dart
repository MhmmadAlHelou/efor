import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/address_data.dart';
import 'package:efor/data/model/address_model.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.faillure;
        }
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteData(String addressid) {
    addressData.deleteData(addressid);
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
