import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  dynamic addCart(String usersId, String itemsId) async {
    var response = await crud
        .postData(AppLink.cartAdd, {'usersid': usersId, 'itemsid': itemsId});
    return response.fold((l) => l, (r) => r);
  }

  dynamic viewCart(String usersId) async {
    var response = await crud.postData(AppLink.cartView, {'usersid': usersId});
    return response.fold((l) => l, (r) => r);
  }

  dynamic deleteCart(String usersId, String itemsId) async {
    var response = await crud
        .postData(AppLink.cartDelete, {'usersid': usersId, 'itemsid': itemsId});
    return response.fold((l) => l, (r) => r);
  }

  dynamic getCountCart(String usersId, String itemsId) async {
    var response = await crud.postData(
        AppLink.cartGetCountItems, {'usersid': usersId, 'itemsid': itemsId});
    return response.fold((l) => l, (r) => r);
  }

  dynamic checkCoupon(String couponName) async {
    var response =
        await crud.postData(AppLink.checkCoupon, {'couponname': couponName});
    return response.fold((l) => l, (r) => r);
  }
}
