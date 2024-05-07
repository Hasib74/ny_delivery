import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';

import 'package:http/http.dart' as http;

import '../../../../../Core/Functions/AppSnackBar.dart';
import '../../../../../Data/_Token/TokenController.dart';
import '../Model/basic_delivery_man_info.dart';

class AppDeliveryManController extends GetxController {
  RxBool isLoading = false.obs;

  static AppDeliveryManController to = Get.find();

  TextEditingController fullNameTextEditingController =
      new TextEditingController();

  TextEditingController phoneNumberTextEditingController =
      new TextEditingController();

  TextEditingController emailTextEditingController =
      new TextEditingController();

  TextEditingController passwordTextEditingController =
      new TextEditingController();

  Rx<BasicDeliveryManInfo?> deliveryMan = new BasicDeliveryManInfo().obs;

  Future<bool> saveDeliveryMan() async {
    bool isSuccess = false;

    if (validateDeliveryMan()) {
      isLoading(true);

      var response = await http
          .post(Uri.parse("${ApiUrls.base_url}vendor/create/delivery_man"),
              body: jsonEncode({
                "full_name": fullNameTextEditingController.value.text,
                "user_name": fullNameTextEditingController.value.text,
                "phone": phoneNumberTextEditingController.value.text,
                "email": emailTextEditingController.value.text,
                "password": passwordTextEditingController.value.text
              }),
              headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${TokenController.to.token}',
          });

      isLoading(false);

      if (response.statusCode == 200 || response.statusCode == 201) {
        isSuccess = true;

        getDeliveryMan();

        AppSnackBar.successSnackbar(msg: "Delivery man created successfully.");
      } else {
        isSuccess = false;
        print("Delivery created response : ${response.body}");

        String errorResponse = "";

        Map data = jsonDecode(response.body)["error"];

        data.forEach((key, value) {
          errorResponse += value.toString() + ",";
        });

        AppSnackBar.successSnackbar(
            msg: errorResponse.replaceAll("[", "").replaceAll("]", ""));
      }
    }

    return isSuccess;
  }

  Future<bool> deleteDeliveryMan(String? id) async {
    bool isSuccess = false;
    Map<String, String> body = {"delivery_men_id": id.toString()};

    try {
      isLoading(true);
      http.Response data = await http.post(
          Uri.parse("${ApiUrls.base_url}delete/deliver-man-profile"),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${TokenController.to.token}',
          });

      isLoading(false);

      if (data.statusCode == 200 || data.statusCode == 201) {
        AppSnackBar.successSnackbar(msg: "Delivery man deleted successfully.");

        isSuccess = true;
        getDeliveryMan();
      } else {
        isSuccess = false;
        AppSnackBar.errorSnackbar(msg: "Failed to delete delivery man.");
      }
    } on Exception catch (e) {
      // TODO

      isSuccess = false;

      AppSnackBar.errorSnackbar(msg: e.toString());
    }
    return isSuccess;
  }

  Future<BasicDeliveryManInfo?> getDeliveryMan() async {
    BasicDeliveryManInfo? deliveryMan;

    http.Response data = await http
        .get(Uri.parse("${ApiUrls.base_url}get-all-delivery_man"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token}',
    });

    if (data.statusCode == 200) {
      print("Delivery man data : ${data.body}");
      deliveryMan = BasicDeliveryManInfo.fromJson(jsonDecode(data.body));

      this.deliveryMan.value = deliveryMan;

      refresh();

      update();
    } else {
      AppSnackBar.errorSnackbar(msg: "Failed to load delivery man.");
    }

    return deliveryMan;
  }

  bool validateDeliveryMan() {
    bool isValid = false;

    if (fullNameTextEditingController.text.isEmpty) {
      isValid = false;

      AppSnackBar.errorSnackbar(msg: "Full name can not be empty.");
    } else if (phoneNumberTextEditingController.text.isEmpty) {
      isValid = false;

      AppSnackBar.errorSnackbar(msg: "Phone number can not be empty.");
    } else if (emailTextEditingController.text.isEmpty) {
      isValid = false;

      AppSnackBar.errorSnackbar(msg: "Email  can not be empty.");
    } else if (passwordTextEditingController.text.isEmpty) {
      isValid = false;

      AppSnackBar.errorSnackbar(msg: "Password  can not be empty.");
    } else if (!emailTextEditingController.text.isEmail) {
      isValid = false;

      AppSnackBar.errorSnackbar(msg: "Email is not valid.");
    } else if (passwordTextEditingController.text.length < 6) {
      isValid = false;

      AppSnackBar.errorSnackbar(
          msg: "Password should be minimum 6 characters.");
    } else {
      isValid = true;
    }

    return isValid;
  }

  void clearAllTextFiled() {
    fullNameTextEditingController.clear();
    phoneNumberTextEditingController.clear();
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
  }

  updateDeliveryMan() async {
    bool isSuccess = false;

    if (validateDeliveryMan()) {
      isLoading(true);

      var response = await http
          .post(Uri.parse("${ApiUrls.base_url}vendor/create/delivery_man"),
              body: jsonEncode({
                "full_name": fullNameTextEditingController.value.text,
                "user_name": fullNameTextEditingController.value.text,
                "phone": phoneNumberTextEditingController.value.text,
                "email": emailTextEditingController.value.text,
                "password": passwordTextEditingController.value.text
              }),
              headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${TokenController.to.token}',
          });

      isLoading(false);

      if (response.statusCode == 200 || response.statusCode == 201) {
        isSuccess = true;

        AppSnackBar.successSnackbar(msg: "Delivery man update successfully.");
      } else {
        isSuccess = false;
        print("Delivery created response : ${response.body}");

        String errorResponse = "";

        Map data = jsonDecode(response.body)["error"];

        data.forEach((key, value) {
          errorResponse += value.toString() + ",";
        });

        AppSnackBar.successSnackbar(
            msg: errorResponse.replaceAll("[", "").replaceAll("]", ""));
      }
    }

    return isSuccess;
  }
}
