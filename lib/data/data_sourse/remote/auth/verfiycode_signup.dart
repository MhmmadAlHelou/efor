import 'package:efor/core/class/crud.dart';
import 'package:efor/link_api.dart';

class VerfiycodeSignUpData {
  Crud crud;
  VerfiycodeSignUpData(this.crud);

  dynamic potData(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiycodeSignUp, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  dynamic resendData(String email) async {
    var response = await crud.postData(AppLink.resnd, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
