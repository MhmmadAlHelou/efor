import 'package:efor/view/screen/address/add.dart';
import 'package:efor/view/screen/address/add_details.dart';
import 'package:efor/view/screen/address/view.dart';
import 'package:efor/view/screen/auth/forget_passwrod/forget_password.dart';
import 'package:efor/view/screen/auth/forget_passwrod/reset_password.dart';
import 'package:efor/view/screen/auth/forget_passwrod/seccess_reset_passwrod.dart';
import 'package:efor/view/screen/auth/forget_passwrod/verifycode.dart';
import 'package:efor/view/screen/auth/login.dart';
import 'package:efor/view/screen/auth/seccess_signup.dart';
import 'package:efor/view/screen/auth/signup.dart';
import 'package:efor/view/screen/auth/verifycode_signup.dart';
import 'package:efor/view/screen/cart.dart';
import 'package:efor/view/screen/checkout.dart';
import 'package:efor/view/screen/delivery/delivery_home.dart';
import 'package:efor/view/screen/delivery/orders/details.dart';
import 'package:efor/view/screen/delivery/orders/tracking.dart';
import 'package:efor/view/screen/favorite_product_details.dart';
import 'package:efor/view/screen/items.dart';
import 'package:efor/view/screen/language/language.dart';
import 'package:efor/view/screen/myfavorite.dart';
import 'package:efor/view/screen/onBoarding.dart';
import 'package:efor/view/screen/product_details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screen/home_screen.dart';
import 'view/screen/orders/archive.dart';
import 'view/screen/orders/details.dart';
import 'view/screen/orders/pending.dart';
import 'view/screen/splash/splash_view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoutes.splashView,
    page: () => const SplashView(),
    middlewares: [MyMiddleWare()],
  ),
  GetPage(name: AppRoutes.language, page: () => const Language()),
  //Auth
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.seccessResetPassword,
      page: () => const SeccessResetPasswrod()),
  GetPage(name: AppRoutes.seccessSignUp, page: () => const SeccessSignUp()),
  GetPage(name: AppRoutes.verfiyCode, page: () => const VerfiyCode()),
  GetPage(
      name: AppRoutes.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //OnBoarding
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),

  ///Home
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  GetPage(
      name: AppRoutes.vaforiteProductDetails,
      page: () => const FavoriteProductDetails()),
  GetPage(name: AppRoutes.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),

  //Address
  GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoutes.addressAddDetails, page: () => const AddressAddDetails()),
  //
  GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
  GetPage(name: AppRoutes.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoutes.ordersArchive, page: () => const OrdersArchice()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),

  //Delivery
  GetPage(name: AppRoutes.deliveryHome, page: () => const DeliveryHome()),
  GetPage(
      name: AppRoutes.deliveryOrdersDetails,
      page: () => const DeliveryOrdersDetails()),
  GetPage(name: AppRoutes.ordersTracking, page: () => const OrdersTracking()),
];
