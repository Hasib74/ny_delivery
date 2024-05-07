import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/AuthenticationRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';

class OtpController extends GetxController {
  static OtpController to = Get.find();
  TextEditingController phoneNumberText = TextEditingController();
  TextEditingController phoneOTPCodeText = TextEditingController();

  String? selectedCountryCode = '+880';
  List<String> allCountries = ["+880", "+1"];

  static String? userPhonoNo;

  bool isPhoneNoScreenProcessingInprogress = false;
  bool isOTPScreenProcessing = false;
  AuthenticationRepository _authenticationRepository =
      new AuthenticationRepository();
  var countDownstart = 30;
  int phoneVerificationOTCode = 0;

  @override
  void onInit() {
    super.onInit();
    loadCountries();
  }

  /*
   ==============================================================
   ===================== Phone Number Screen ====================
   ==============================================================
   */
  phoneNumberVerification() {
    generateRandomNumber();
    if (phoneNumberFormValidation() && phoneVerificationOTCode > 999) {
      isPhoneNoScreenProcessingInprogress = true;
      update();
      String phoneNo = phoneNumberText.text;
      String countryCode = selectedCountryCode!.substring(1);
      if (phoneNo.contains(countryCode)) {
        phoneNo = phoneNo.substring(countryCode.length);
      } else if (phoneNo[0] == '0') {
        phoneNo = phoneNo.substring(1);
      }
      phoneNo = countryCode + '' + phoneNo;
      userPhonoNo = phoneNo;
      print("phone number okey...${phoneNo}");
      sendOTPCode(userPhonoNo); //temporary OFF
      //  Get.toNamed(AppRoutes.OTPSCREEN);
    }
  }

  updateSelectedMenuItem(String? newValue) {
    selectedCountryCode = newValue;
    update();
  }

  sendOTPCode(String? phoneNumber) async {

    Get.toNamed(AppRoutes.OTPSCREEN);


    Either<http.Response?, Failure>? authResponse =
        await (_authenticationRepository.sendPhoneVerificationOTPCode(
            phoneNumber, phoneVerificationOTCode.toString()) );

    authResponse!.fold((l) {
      print("phone otp send suscess " + l!.body);
      isPhoneNoScreenProcessingInprogress = false;
      Map valueMap = jsonDecode(l.body.toString());
      if (valueMap['success'] == 'true') {
        Get.toNamed(AppRoutes.OTPSCREEN);
      } else {
        Get.toNamed(AppRoutes.OTPSCREEN);
        update();
        errorSnackbar(msg: "Network Error");
      }
    }, (r) {
      isPhoneNoScreenProcessingInprogress = false;
      update();
      errorSnackbar(msg: "Network Error");

      Get.toNamed(AppRoutes.OTPSCREEN);
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

  /*
   ==============================================================
   ===================== OTP Check =============================
   ==============================================================
   */

  phoneNumberOTPCodeVerification() async {
    if (phoneVerificationOTCode == 0) {
      errorSnackbar(msg: "Your OTP Code Expired");
    } else if (phoneVerificationOTCode.toString() == phoneOTPCodeText.text) {
      _timer!.cancel();
      _timer = null;
      countDownstart = 0;
      Get.toNamed(AppRoutes.SIGNUP, arguments: userPhonoNo);
    } else {
      errorSnackbar(msg: "Invalid OTP Code");
    }
  }

  phoneNumberOTPCodeFormValidation() {
    if (phoneOTPCodeText.text.isEmpty) {
      print('opt error ${phoneOTPCodeText.text}');
      errorSnackbar(msg: "Invalid OTP Code");
      return false;
    }
    return true;
  }

  /*
   ==============================================================
   ===================== OTP Resend =============================
   ==============================================================
   */

  void resendOTPCode() {
    print('resend code ');
    generateRandomNumber();
    sendOTPCode(userPhonoNo);
    startCountdownTimer();
  }

  Timer? _timer;
  int timerIncrementStepValue = 0;

  void startCountdownTimer() {
    countDownstart = 40 + timerIncrementStepValue;
    if (_timer != null) {
      print('reset timer');
      _timer!.cancel();
    }
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (countDownstart <= 0) {
          print('invalid timer');
          _timer!.cancel();
          _timer = null;
          phoneVerificationOTCode = 0;
          timerIncrementStepValue += 20;
        } else {
          countDownstart--;
          print('calling again ${countDownstart}');
        }
        update();
      },
    );
  }

  /*
   ==============================================================
   ===================== HELPER METHODS =============================
   ==============================================================
   */

  void loadCountries() async {
    Either<dynamic, Failure> authResponse =
        await (_authenticationRepository.getAllCountries() as FutureOr<Either<dynamic, Failure>>);
    authResponse.fold((l) {
      Map valueMap = jsonDecode(l.body);
      print(valueMap['message']);
      List<String> list =  <String>[];
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

  int generateRandomNumber() {
    Random random = new Random();
    int max = 9999, min = 1000;
    phoneVerificationOTCode = min + random.nextInt(max - min);
    print("range value is " + phoneVerificationOTCode.toString());

    AppSnackBar.successSnackbar(msg: "The Otp is ${phoneVerificationOTCode}");
    return phoneVerificationOTCode;
  }
}
