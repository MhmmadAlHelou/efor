import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  potData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
