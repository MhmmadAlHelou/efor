class AppLink {
  static const String server = "http://192.168.1.107/efor";
  static const String imageStatic = "$server/upload";

  static const String test = "$server/test.php";

  //__________Image___________//
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";

  //______________Auth______________//
  static const String signup = "$server/auth/signup.php";
  static const String verfiycodeSignUp = "$server/auth/verfiycode.php";
  static const String resnd = "$server/auth/resend.php";
  static const String login = "$server/auth/login.php";

  //_______Forget Password_________//
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeForgetPassword =
      "$server/forgetpassword/verifycode.php";

  //Home
  static const String homePage = "$server/home.php";
  //Items
  static const String items = "$server/items/items.php";
  static const String search = "$server/items/search.php";
  //Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromFavorite =
      "$server/favorite/delete_from_favorite.php";
  //Cart
  static const String cartView = "$server/Cart/view.php";
  static const String cartAdd = "$server/Cart/add.php";
  static const String cartDelete = "$server/Cart/delete.php";
  static const String cartGetCountItems = "$server/Cart/get_count_items.php";
  //Address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";
  //Coupon
  static const String checkCoupon = "$server/coupon/check_coupon.php";
  //Orders
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingOrders = "$server/orders/pending.php";
  static const String archiveOrders = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";
  //notification
  static const String notification = "$server/notification/notification.php";
  ////
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";

  //Delivery Orders
  static const String deliveryAcceptedOrders =
      "$server/delivery/orders/accepted.php";
  static const String deliveryDoneOrders = "$server/delivery/orders/done.php";
  static const String deliveryApproveOrders =
      "$server/delivery/orders/approve.php";
  static const String deliveryPendingOrders =
      "$server/delivery/orders/pending.php";
  static const String deliveryOrdersDetails =
      "$server/delivery/orders/details.php";
  static const String deliveryArchiveOrders =
      "$server/delivery/orders/archive.php";
}
