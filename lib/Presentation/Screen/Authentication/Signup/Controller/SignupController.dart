import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapData.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/SignupRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/AppConstant.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/AppConstantData.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/ExceptionHandle.dart';
import 'dart:io';

import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';

class SignupController extends GetxController {
  static SignupController to = Get.find();

  TextEditingController nameController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController countryController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController profileImageController = new TextEditingController();

  //
  TextEditingController vehicleTypeController = new TextEditingController();
  TextEditingController workingAreaController = new TextEditingController();

  //call repository
  SignupRepository _authenticationRepository = SignupRepository();

  RxBool isLoading = false.obs;
  RxBool isAgreePrivacyPolicy = false.obs;
  File? nidCardImageFile, profilePhoto;
  var isloadingCameraorGalleryFor = 1;

  LatLng? currentLatLng;

  //print('phone number '+userInformation[0]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // var userInfo = Get.arguments;
    print('onit method phone number ');
    // phone no, "01621417585";
    // setUserDefaultData();
  }

  void setUserDefaultData() {
    nameController.text = "Mr xyz";
    usernameController.text = "xyz";
//    phoneController.text = Get.arguments.toString();
    emailController.text = "xyz@gmail.com";
    descriptionController.text = "abc... ... ..";
    // addressController.text = "Brorbazar,Amborkhana,sylhet";
    genderController.text = "1"; //male
    vehicleTypeController.text = "1";

    ///bike
    workingAreaController.text = "1";
    countryController.text = "Bangladesh";
    passwordController.text = "123456";
    confirmPasswordController.text = "123456";
    // MapData.userPosition.determinePosition().then((value) {
    //   MapData.mapFunction
    //       .latLagToString(LatLng(value.latitude, value.longitude))
    //       .then((value) => addressController.text = value);
    // });
  }

  setPrivacyPolicyAgreement(bool isAgree) {
    this.isAgreePrivacyPolicy.value = isAgree;
    update();
  }

  SignUp() async {
    if (signupValidation()) {
      isLoading.value = true;
      var body = {
        "full_name": nameController.value.text,
        "address": addressController.value.text,
        "description": descriptionController.value.text,
        "phone": phoneController.value.text,
        "country_id": "+880",
        "email": emailController.value.text,
        "gender_id": genderController.value.text,
        "password": passwordController.value.text,
        "c_password": confirmPasswordController.value.text,
        "user_name": usernameController.value.text,
        "vehicle_type": vehicleTypeController.value.text,
        "working_area": workingAreaController.value.text,
        "lat_value": "${currentLatLng?.latitude ?? "90.00"}",
        "long_value": "${currentLatLng?.longitude ?? "90.11"}",
      };

      await Future.delayed(Duration(seconds: 3));
      isLoading.value = false;

      AppSnackBar.successSnackbar(msg: "Signup Successfully");


      // Either<dynamic, Failure>? response = await (_authenticationRepository
      //     .deliveryManSignUp(body, nidCardImageFile, profilePhoto));
      //
      // response!.fold((l) {
      //   if (l[AppConstant.success] != true) {
      //     isLoading.value = false;
      //     update();
      //     if (l[AppConstant.error] != null) {
      //       AppSnackBar.errorSnackbar(msg: l[AppConstant.error].toString());
      //     } else {
      //       AppSnackBar.errorSnackbar(msg: l[AppConstant.message].toString());
      //     }
      //   } else {
      //     print('signup comleted ${l['token']}');
      //
      //     TokenController.to.token = l['token'];
      //     LocalDataSourceController.to.setToken(l['token']);
      //
      //     isLoading.value = false;
      //     update();
      //     Get.offAllNamed(AppRoutes.DRAWERMENHOMESCREEN);
      //   }
      // }, (r) {
      //   ExceptionHandle.exceptionHandle(r);
      //   AppSnackBar.errorSnackbar(msg: 'Network Error');
      // });
    } else {}
  }

  signupValidation() {
    if (nameController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Name is required");
      return false;
    } else if (usernameController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "User-name is required");
      return false;
    } else if (phoneController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Phone number is required");
      return false;
    } else if (emailController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Email is required");
      return false;
    } else if (passwordController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Password is required");
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Confirm Password is required");
      return false;
    } else if (addressController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Address is required");
      return false;
    } else if (isAgreePrivacyPolicy.value == false) {
      AppSnackBar.errorSnackbar(
          msg: "You must have to Agree Our Privacy Policy");
      return false;
    } else if (profilePhoto == null) {
      AppSnackBar.errorSnackbar(msg: "Please Choose your Profile Photo");
      return false;
    } else if (nidCardImageFile == null) {
      AppSnackBar.errorSnackbar(msg: "Please set your NID Card Photo");
      return false;
    } else {
      return true;
    }
  }

  setNidCardImageFile(File file) {
    if (isloadingCameraorGalleryFor == 1) {
      this.profilePhoto = file;
    } else {
      this.nidCardImageFile = file;
    }
    update();
  }

  void changeAddress(String value) {
    addressController.text = value;
    update();
  }
}
