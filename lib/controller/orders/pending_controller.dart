import 'package:efor/core/class/statusrequest.dart';
import 'package:efor/core/functions/handling_data_controller.dart';
import 'package:efor/core/services/services.dart';
import 'package:efor/data/data_sourse/remote/orders/pending_data.dart';
import 'package:efor/data/model/orders_model.dart';
import 'package:get/get.dart';

class OrdersPendingController extends GetxController {
  MyServices myServices = Get.find();

  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  late StatusRequest statusRequest;

  List<OrdersModel> data = [];

  String delivryTime = '';

  String printOrderType(String val) {
    if (val == '0') {
      return 'Delivery';
    } else {
      return 'Drive Thru';
    }
  }

  String printPaymentMethod(String val) {
    if (val == '0') {
      return 'Cash on Delivery';
    } else {
      return 'Payment Card';
    }
  }

  String printOrderStatus(String val) {
    if (val == '0') {
      return 'Pending Approval';
    } else if (val == '1') {
      return 'The Order is bing prepared';
    } else if (val == '2') {
      return 'Ready To Picked up by Delivery Man';
    } else if (val == '3') {
      return 'On The Way';
    } else {
      return 'Archive';
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString('id')!);
    print("===================connn $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.faillure;
      }
    }
    update();
  }

  deleteOrders(String orderid) {
    Get.defaultDialog(
      title: 'Attention!',
      middleText: 'Are you sure you want to Delete the order!',
      textCancel: 'Cancel',
      textConfirm: 'Confirm',
      onConfirm: () async {
        data.clear();
        statusRequest = StatusRequest.loading;
        update();
        var response = await ordersPendingData.deleteData(orderid);
        print("===================connn $response");
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            refreshOrder();
          } else {
            statusRequest = StatusRequest.faillure;
          }
        }
        update();
      },
    );
  }

  refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    delivryTime = myServices.sharedPreferences.getString('deliverytime')!;
    getOrders();
    super.onInit();
  }
}
