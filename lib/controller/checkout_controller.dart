import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/address_data.dart';
import 'package:efor/data/data_sourse/remote/checkout_data.dart';
import 'package:efor/data/model/address_model.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());

  List<AddressModel> dataAddress = [];

  String? paymentMethod;
  String? deliveryType;
  String addressId = '0';

  late String couponId;
  late String couponDiscount;
  late String priceOrder;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShoppingAddress(String val) {
    addressId = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressId = dataAddress[0].addressId.toString();
      } else {
        // statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar('Error', 'Please select a payment method');
    }
    if (deliveryType == null) {
      return Get.snackbar('Error', 'Please select an order type');
    }
    if (dataAddress.isEmpty) {
      return Get.snackbar('Error', 'Please select shipping address');
    }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      'usersid': myServices.sharedPreferences.getString('id'),
      'addressid': addressId,
      'orderstype': deliveryType,
      'paymentmethod': paymentMethod,
      'pricedelivery': '10',
      'ordersprice': priceOrder,
      'coupondiscount': couponDiscount,
      'couponid': couponId,
    };
    var response = await checkoutData.checkout(data);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar('Success', "The Order Was Successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar('ERROR', "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'];
    priceOrder = Get.arguments['priceorder'];
    couponDiscount = Get.arguments['couponDiscount'];
    getShippingAddress();
    super.onInit();
  }
}
