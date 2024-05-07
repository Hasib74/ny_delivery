import 'dart:convert';

import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Model/Cart.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalKey.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceController extends GetxController {
  late SharedPreferences sp;

  static LocalDataSourceController to = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    spInit();
  }

  void spInit() async {
    sp = await SharedPreferences.getInstance();

    LocalDataSourceController.to.getToken();
  }

  void setSelectedServiceName(String serviceName) async {
    sp.setString('service_name', serviceName);
  }

  Future<String?> getSelectedServiceName() async {
    print("your service name ${sp.get('service_name')}");
    return sp.getString('service_name');
  }

  void storeCart(List<Cart> cartLst) {
    print("LocalDataSourceController :: = > Encoded ");
    try {
      print("LocalDataSourceController :: = > Encoded ${jsonEncode(cartLst)}");

      // List<String> cartList = new List();

      // cartLst.forEach((element) {
      //   cartList.add(jsonEncode(element.toJson()));
      // });

      // sp.setString(LocalKey.cart_list, jsonEncode(cartList));
    } catch (err) {
      print("LocalDataSourceController :: = > Encoded Error ${err}");
    }
  }

  getCartList() {
    try {
      return sp.getString(LocalKey.cart_list);
    } catch (err) {
      return null;
    }
  }

  setToken(String token) {
    sp.setString(LocalKey.token, token);
  }

  Future<String?> getToken() async {
    var _response;

    await Future.delayed(Duration(seconds: 2)).then((value) {
      var data = sp.getString(LocalKey.token);

      TokenController.to.token = data;
      print("Token data ===> ${data}");

      if (data == null) {
        _response = null;
      } else {
        _response = data; //  Token.fromJson(jsonDecode(data));
      }
    });

    return _response;
  }

  setFullName(String name) {
    sp.setString(LocalKey.full_name, name);
  }

  String? getFullName() {
    return sp.getString(LocalKey.full_name);
  }

  setDeliveryManId(String id) {
    sp.setString(LocalKey.delivery_man_ID, id);
  }

  String? getDeliveryManId() {
    return sp.getString(LocalKey.delivery_man_ID);
  }

  setAddress(String address) {
    sp.setString(LocalKey.address, address);
  }

  String? getAddress() {
    return sp.getString(LocalKey.address);
  }

  setEmail(String email) {
    sp.setString(LocalKey.email, email);
  }

  getEmail() {
    return sp.getString(LocalKey.email);
  }

  setPhoneNumber(String phone) {
    sp.setString(LocalKey.phone, phone);
  }

  String? getPhoneNumber() {
    return sp.getString(LocalKey.phone);
  }

  setProfileImage(String profileImage) {
    sp.setString(LocalKey.delivery_men_image, profileImage);
  }

  String? getProfileImage() {
    return sp.getString(LocalKey.delivery_men_image);
  }
}
