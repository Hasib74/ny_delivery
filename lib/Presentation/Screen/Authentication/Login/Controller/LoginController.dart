import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/LoginRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/AppConstantData.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/ExceptionHandle.dart';
class LoginController extends GetxController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  //call repository
  LoginRepository _loginRepository = LoginRepository();

  RxBool isLoading = false.obs;

  @override
    void onInit() {
      // TODO: implement onInit
      super.onInit();

     // emailController.text = "hasib@gmail.com";
    //  passwordController.text = "123456";
    }

    static LoginController to = Get.find();



    Future<bool> Login() async {
      bool isSuccess = false;
      if(loginValidation()) {
        isLoading.value = true;

        var body = {
          "email": emailController.value.text,
          "password": passwordController.value.text,
        };

        Either<dynamic, Failure>? response =
        await (_loginRepository.deliveryLogin(body));

        response!.fold((l) {
          if (jsonDecode(l.body)["error"] == null) {

            TokenController.to.token = jsonDecode(l.body)['token'] ;
            LocalDataSourceController.to.setToken(jsonDecode(l.body)['token']);


            print("Token is : ${TokenController.to.token}");

            //AppConstantData.token = _authenticationLocalRepo.getToken().token;


            isLoading.value = false;

            isSuccess = true;
          }
          else {
          ExceptionHandle.exceptionMessage(jsonDecode(l.body)["message"]);
         //  AppSnackBar.errorSnackbar(msg: "Invalid Email Or Password");

          isLoading.value = false;


          isSuccess = false;
        }
        }, (r) {
          ExceptionHandle.exceptionHandle(r);
          isSuccess = false;
        });
      }else {

        isLoading.value = false;

        isSuccess = false;
      }


      return isSuccess;
    }

    loginValidation() {
      if (emailController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Email is required");
      return false;
    } else if (passwordController.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Password is required");
      return false;
    }
    return true;
  }

}