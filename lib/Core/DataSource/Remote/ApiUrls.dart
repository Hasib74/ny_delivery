class ApiUrls {
  static String download_base_url = "https://wingsthingsandpizzas.eventsandimage.com/";
  static String base_url = "https://wingsthingsandpizzas.eventsandimage.com/api/delivery_man/";

  //static String base_url = "https://onlineordering201.com/api/delivary-order-status-update";

  //Signup
  static String country_list = "${base_url}get-countries";

  //Authentication
  static String phone_no_verificaton = "${base_url}getphone-otpcode";
  static String phone_verfication_OTP_checking =
      "${base_url}checkphone-otpcode";
  static String userLoginAuthentication = "${base_url}login";

  //Signup
  static String deilvery_signup =
      "${base_url}delivery-men/registration-with-phone";

  //Login
  static String deilvery_login = "${base_url}login";
  static String deilvery_man_profile_details =
      "${base_url}my-profile";
  static String deilvery_man_profile_update =
      "${base_url}delivery-man/my-profile/update";
  static String deilvery_Password_update = "${base_url}vendor/change-password";

  //Accout Recovery
  static String account_recovery = "${base_url}delivery-men/account-recovery";

  ///get new order

  static String getAllNewOrder = "${base_url}order-new-orders";
  static String acceptOrder = "${base_url}update-confirm/list";
  static String declineOrder = "${base_url}cancel-order/list";
  static String pendingOrder = "${base_url}pending-orders/list";
  static String itemPickFromVendor =
      "${base_url}orderitems-received-fromvendor";
  static String completedOrder = "${base_url}deliveryman/order-completed";
  static String neworder_list = "${base_url}deliveryman/new-order-list";

  //static String order_accept = "${base_url}order-accepted";
  static String order_accept =
      "${base_url}delivary-order-status-update";
  static var updateDeviceToken = "${base_url}delivery-man/update-device-token";
  static String picked_order =
      "${base_url}deliveryman/my/already-picked-order-list";
  static String orderItemPickFromVendor =
      "${base_url}deliveryman/orderitems-picked-from-vendor";

  static String deliveryHistory = "${base_url}deliveryman/my/completed-order";

  static String getOrderDetails = "${base_url}get/order-details";

  static var orderHistory = "${base_url}delivery/history";

  static var getOrderProductList = "${base_url}vendor/order/product-list/";
// static String deliveryHistory = "${base_url}deliveryman/order-completed";
}
