import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class OrdersArchiceData {
  Crud crud;
  OrdersArchiceData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.archiveOrders, {'id': userid});
    return response.fold((l) => l, (r) => r);
  }

  ratingData(String orderid, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating, {
      'id': orderid,
      'rating': rating,
      'comment': comment,
    });
    return response.fold((l) => l, (r) => r);
  }
}
