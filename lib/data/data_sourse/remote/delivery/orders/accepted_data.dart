import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class DeliveryOrdersAcceptedData {
  Crud crud;
  DeliveryOrdersAcceptedData(this.crud);

  getData(String deliveryid) async {
    var response =
        await crud.postData(AppLink.deliveryAcceptedOrders, {'id': deliveryid});
    return response.fold((l) => l, (r) => r);
  }

  doneDeliveryData(String ordersid, String usersid) async {
    var response = await crud.postData(AppLink.deliveryDoneOrders, {
      'ordersid': ordersid,
      'usersid': usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
