import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  potData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
