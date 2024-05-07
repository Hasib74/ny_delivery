import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/DeviceTokenRemoteRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/DeviceTokenRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/ProfileRepository.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/AppConstant.dart';

import '../../../../Data/Model/delivery_man_profile.dart';
import '../../Notification/NotificationController/NotificationController.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find();

  var profileId = "";

  ProfileRepository _profileRepository = new ProfileRepository();
  DeviceTokenRepository _deviceTokenRepository = DeviceTokenRemoteRepository();

  TextEditingController emailText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController fullnameText = TextEditingController();
  TextEditingController addressText = TextEditingController();

  TextEditingController userNameText = TextEditingController();

  TextEditingController passwordText = TextEditingController();

  Rx<DeliveryManProfile> profileInfoDetails = new DeliveryManProfile().obs;

  List<Map<String, dynamic>>? divisionAreas;
  Map<String, dynamic> selectedDivisionArea = {"id": 0, "vale": "Selec One"};

  RxBool loading = false.obs;

  Rx<File> profileImage = File("").obs;

  //static ProfileController to = Get.find();
  Rx<File>? nidCardImageFile, profilePhoto = File("").obs;
  var isloadingCameraorGalleryFor = 1; // profile photo, 2= NID Photo

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initState();
  }

  void initState() {
    print('profile info calling ');
    getProfileInformation();
  }

  Future getProfileInformation() async {
    loading.value = true;
    Either<dynamic, Failure> response =
        await _profileRepository.getDeliveryManDetailsInformation();

    print('comleted 1 ${response}');

    response.fold((l) {
      print('comleted 1 ${jsonDecode(l.body)}');

      print("Profile Info : ${l}");

      var info = jsonDecode(l.body);
      print('comleted 2 ${info}');

      print('comleted 3 ${info}');

      profileInfoDetails.value = DeliveryManProfile.fromJson(info);

      // NotificationController.to.getNewOrderData(context);

      fullnameText.text = profileInfoDetails.value.response!.fullName!;
      emailText.text = profileInfoDetails.value.response!.email!;
      phoneText.text = profileInfoDetails.value.response!.phone!;
      LocalDataSourceController.to
          .setFullName(profileInfoDetails.value.response!.fullName!);
      LocalDataSourceController.to
          .setEmail(profileInfoDetails.value.response!.email!);
      LocalDataSourceController.to
          .setPhoneNumber(profileInfoDetails.value.response!.phone!);
      // LocalDataSourceController.to
      //     .setAddress(profileInfoDetails.value.response.address);
      LocalDataSourceController.to
        ..setDeliveryManId(
            profileInfoDetails.value.response!.deliveryMenId.toString());
      // LocalDataSourceController.to
      //     .setProfileImage(profileInfoDetails.value.response.profilePhoto);

      loading.value = false;

      return true;
    }, (right) {
      loading.value = false;
    });
  }

  Future<bool> updateProfile() async {
    bool _isSuccess = false;

    // update profile with file image

    if (formValidation()) {
      loading.value = true;

      Map<String, String> _map = {
        if (fullnameText.value.text.isNotEmpty)
          "full_name": fullnameText.value.text,
        if (userNameText.value.text.isNotEmpty)
          "user_name": userNameText.value.text,
        if (phoneText.value.text.isNotEmpty) "phone": phoneText.value.text,
        if (emailText.value.text.isNotEmpty) "email": emailText.value.text,
        if (passwordText.value.text.isNotEmpty)
          "password": passwordText.value.text,
      };
      Either<dynamic, Failure>? response = await _profileRepository
          .updateDeliveryManProfileDetails(_map, profileImage.value);

      loading.value = false;

      response!.fold((l) {
        print("Profile Info : ${l}");

        getProfileInformation();

        _isSuccess = true;
      }, (right) {
        loading.value = false;
      });
    }

    return _isSuccess;
  }

  bool formValidation() {
    if (emailText.text.isEmpty || emailText.text.isBlank!) {
      AppSnackBar.errorSnackbar(msg: 'Enter Email Address');
      return false;
    } else if (phoneText.text.isEmpty || phoneText.text.isBlank!) {
      AppSnackBar.errorSnackbar(msg: 'Enter Phone Address');
      return false;
    } else if (fullnameText.text.isEmpty || fullnameText.text.isBlank!) {
      AppSnackBar.errorSnackbar(msg: 'Enter Name Address');
      return false;
    }
    /*else if(nidCardImageFile == null){

      AppSnackBar.errorSnackbar(msg: 'NID image can not be null.');
      return false;

    }*/
    else if (profilePhoto == null) {
      AppSnackBar.errorSnackbar(msg: 'Profile image can not be null.');
      return false;
    }

    return true;
  }

  setNidCardImageFile(File file) {
    if (isloadingCameraorGalleryFor == 1) {
      this.profilePhoto!.value = file;
    } else {
      this.nidCardImageFile!.value = file;
    }
  }

  saveDeviceToken(String deviceToken) {
    _deviceTokenRepository.saveDeviceToken(deviceToken,
        profileInfoDetails.value.response!.deliveryMenId.toString());
  }
}
