import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class DeliveryOrdersPendingData {
  Crud crud;
  DeliveryOrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.deliveryPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String deliveryid, String userid, String orderid) async {
    var response = await crud.postData(AppLink.deliveryApproveOrders, {
      'deliveryid': deliveryid,
      'usersid': userid,
      'ordersid': orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
