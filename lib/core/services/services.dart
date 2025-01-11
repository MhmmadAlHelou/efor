import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    GetPlatform.isAndroid
        ? await Firebase.initializeApp(
            options: const FirebaseOptions(
              apiKey: 'AIzaSyAXH9jJ3k6u0mwENNTDdGLFFyYASDLbJJs',
              appId: '1:726561898777:android:6a7385a027b708591d0588',
              messagingSenderId: '726561898777',
              projectId: 'efor-e81af',
            ),
          )
        : await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
