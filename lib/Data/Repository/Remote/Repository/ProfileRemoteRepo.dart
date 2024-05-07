import 'dart:convert';

import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiClient.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Network/network_info.dart';
import 'dart:io';

class ProfileRemoteRepo {
  NetworkInfoController _networkInfoController = Get.find();

  Future<Either<dynamic, Failure>> getDeliveryManDetails() async {
    try {
      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
            url: ApiUrls.deilvery_man_profile_details,
            body: null,
            enableHeader: true,
            method: Method.GET);

        printInfo(info: "Delivery man profile Response ::: ${response.body}");
        if (response == null)
          return Right(NoConnectionFailure());
        else
          return Left(response);
      } else {
        print("Noooooooooo Network");
        return Right(NoConnectionFailure());
      }
    } catch (err) {
      print(" profile Response Error : ${err} ");
      return Right(ServerFailure());
    }
  }

  Future<Either<dynamic, Failure>> updateDeliveryManProfileDetails(
      Map<String, String> bodyData,
      List<File> files,
      List<String> fileKeys) async {
    try {
      Map<String, String> bodyData1 = {
        "id": 'id',
      };
      Map<dynamic, dynamic> hh = {};

      if (await _networkInfoController.isConnected) {
        dynamic response;

        print("Update profile :  file ==> ${files[0].path.isEmpty}");

        if (files[0].path.isNotEmpty) {
          response = await ApiClient.RequestWithFile(
              url: ApiUrls.deilvery_man_profile_update,
              body: bodyData,
              fileKey: fileKeys,
              files: files,
              magic_method_allow: false,
              headerRequired: true,
              headerData: hh,
              method: Method.POST);
        } else {
          response = await ApiClient.Request(
              url: ApiUrls.deilvery_man_profile_update,
              body: bodyData,
              method: Method.PUT);
        }

        printInfo(info: "Delivery man profile Response ::: ${response}");
        return Left(response);
      } else {
        print("Noooooooooo Network");
        return Right(NoConnectionFailure());
      }
    } catch (err) {
      print(" profile Response Error : ${err} ");
      return Right(ServerFailure());
    }
  }

  Future<Either<dynamic, Failure>> updateDeliveryManCredentials(
      String currentPassword, String newPass, String retypePass) async {
    try {
      Map<String, dynamic> bodyData = {
        "current_password": currentPassword,
        "new_password": newPass,
        "new_password_confirmation": retypePass,
      };

      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
            url: ApiUrls.deilvery_Password_update,
            body: jsonEncode(bodyData),
            enableHeader: true,
            method: Method.POST);

        printInfo(info: "deilvery_Password_update Response ::: ${response}");
        return Left(response);
      } else {
        print("Noooooooooo Network");
        return Right(NoConnectionFailure());
      }
    } catch (err) {
      print("Error : ${err} ");
      return Right(ServerFailure());
    }
  }
}
