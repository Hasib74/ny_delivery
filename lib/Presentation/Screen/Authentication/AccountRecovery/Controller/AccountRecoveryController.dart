import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/AuthenticationRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';

class AccountRecoveryController extends GetxController {
  static AccountRecoveryController to = Get.find();
  TextEditingController phoneNumberText = TextEditingController();
  TextEditingController phoneOTPCodeText = TextEditingController();

  String? selectedCountryCode = '+880';
  List<String> allCountries = ["+880", "+1"];

  static String? userPhonoNo;


  bool isPhoneNoScreenProcessingInprogress = false;
  bool isOTPScreenProcessing = false;
  AuthenticationRepository _authenticationRepository =
      new AuthenticationRepository();

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();
      loadCountries();
    }

    phoneNumberVerification()
    {
      if(phoneNumberFormValidation()) {
        isPhoneNoScreenProcessingInprogress = true;
        update();
        String phoneNo = phoneNumberText.text;
        String countryCode = selectedCountryCode!.substring(1);
        if(phoneNo.contains(countryCode)) {
          phoneNo = phoneNo.substring(countryCode.length);
        }else if (phoneNo[0] == '0') {
          phoneNo = phoneNo.substring(1);
        }
        phoneNo = countryCode + '' +phoneNo;
        userPhonoNo = phoneNo;
        print("phone number is..........${userPhonoNo}");

        sendAccountRecoveryPassword(userPhonoNo);
      }
    }

    updateSelectedMenuItem(String? newValue) {
      selectedCountryCode = newValue;
      update();
    }

    sendAccountRecoveryPassword(String? phoneNumber) async {
      Either<http.Response?,Failure>? response = await (_authenticationRepository.sendAccountRecoveryPassword(
        phoneNumber) );

        response!.fold((l) {
          
          isPhoneNoScreenProcessingInprogress = false;
          Map valueMap = jsonDecode(l!.body.toString());

          print("...............value map.........${valueMap['success']}");
          if((valueMap['success'] == 'true') && (valueMap['status_code'] == '200')) {
            Get.toNamed(AppRoutes.LOGIN);
            AppSnackBar.successSnackbar(msg: "New Password sent successfully");
            isPhoneNoScreenProcessingInprogress = false;
          }
          else if((valueMap['success'] == 'true') && (valueMap['status_code'] == '404')) {
            update();
            errorSnackbar(msg: "Not Registered Number");
            isPhoneNoScreenProcessingInprogress = false;
          }
          else {
            update();
            errorSnackbar(msg: "Network Error");
          }
        }, (r) {
          isPhoneNoScreenProcessingInprogress = false;
          update();
          errorSnackbar(msg: "Network Error");
        });
    }

    phoneNumberFormValidation() {
    if (phoneNumberText.text.isEmpty || phoneNumberText.text.isBlank!) {
      errorSnackbar(msg: "Invalid Phone Number");
      return false;
    } else if (!phoneNumberText.text.isNum) {
      errorSnackbar(msg: "Invalid Phone Number");
      return false;
    }
    return true;
  }

   

    void loadCountries() async {
    Either<dynamic, Failure>? authResponse =
        await (_authenticationRepository.getAllCountries() );
    authResponse!.fold((l) {
      Map valueMap = jsonDecode(l.body);
      print(valueMap['message']);
      List<String> list = <String>[];
      valueMap['message'].forEach((v) {
        list.add(v['phone_code'].toString());
        print(v['phone_code'].toString());
      });
      if (list.length > 2) {
        allCountries = list;
        update();
      }
    }, (r) {});
  }

  void errorSnackbar({required String msg}) {
     Get.snackbar('$msg', "Error !",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.deepOrange[200],
        colorText: Colors.white);
  }

  // void successSnackbar({@required String msg}) {
  //   return Get.snackbar('$msg', "Success !",
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.deepOrange[200],
  //       colorText: Colors.white);
  // }
}