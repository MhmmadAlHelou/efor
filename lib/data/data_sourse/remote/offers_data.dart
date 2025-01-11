import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
