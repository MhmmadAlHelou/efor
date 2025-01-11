import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'Note Valid UserName';
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Note Valid Email';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Note Valid Phone';
    }
  }

  if (val.isEmpty) {
    return "Can't be empty";
  }

  if (val.length < min) {
    return "Can't be less than $min";
  }

  if (val.length > max) {
    return "Can't be larger than $max";
  }
}
