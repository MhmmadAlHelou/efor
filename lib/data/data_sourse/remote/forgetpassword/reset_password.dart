import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  potData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
