

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/ProfileRepository.dart';

import '../../../../Data/Model/delivery_man_profile.dart';

class CredentialController extends GetxController{

  ProfileRepository _profileRepository = new ProfileRepository();

  DeliveryManProfile? profileInfoDetails;
  TextEditingController  currentPasswordTextField = new TextEditingController();
  TextEditingController  newPasswordTextField = new TextEditingController();
  TextEditingController  retypePasswordTextField = new TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("calling for profile inofo 1 ");
    getProfileInformation();
  }




  void getProfileInformation()async {
    print("calling for profile inofo 2");
    Either<dynamic,Failure> response = await  _profileRepository.getDeliveryManDetailsInformation();

    response.fold((l){
      print("Left ===>  ${l.body}");
        profileInfoDetails = DeliveryManProfile.fromJson(jsonDecode(l.body));
        update();

    },(r){
      print("right ===>  ${r}");

    });


  }




  void updateCredentialsInfo() async{

    if(currentPasswordTextField.text == '' || currentPasswordTextField.text.isBlank!)
      {
        AppSnackBar.errorSnackbar(msg: "Current Password is required ");
      } else if(newPasswordTextField.text == '' || newPasswordTextField.text.isBlank!){
             AppSnackBar.errorSnackbar(msg: "New Password is required ");
       }else if(newPasswordTextField.text != retypePasswordTextField.text){
              AppSnackBar.errorSnackbar(msg: " Password do not match ");

       }else {

           Either<dynamic, Failure>? response = await (_profileRepository
          .updateDeliveryManCredentials(
                  newPasswordTextField.text, newPasswordTextField.text,
                  retypePasswordTextField.text) );

             response!.fold((left) {
               Map<String,dynamic> info = jsonDecode(left.body);
               if(info['success'] == true) {
                     AppSnackBar.successSnackbar(msg: "Update Successfully Completed");
                 }else {
                     AppSnackBar.errorSnackbar(msg:info['message'].toString());
               }
              }, (right) {
                    AppSnackBar.errorSnackbar(msg: "Update Failed");
              });
    }

  }


}