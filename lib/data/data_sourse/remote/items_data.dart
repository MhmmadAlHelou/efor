import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(int id, String usersid) async {
    var response = await crud
        .postData(AppLink.items, {'id': id.toString(), 'usersid': usersid});
    return response.fold((l) => l, (r) => r);
  }
}
