import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingOrders, {'id': userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(AppLink.ordersDelete, {'id': orderid});
    return response.fold((l) => l, (r) => r);
  }
}
