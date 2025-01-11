import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersDetails, {'id': id});
    return response.fold((l) => l, (r) => r);
  }
}
