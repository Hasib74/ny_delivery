import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiClient.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Network/network_info.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

NetworkInfoController _networkInfoController = Get.find();

class SignupRemoteRepo {


Future<Either<dynamic, Failure>> signUp(body,List<File?> files, List<String> fileKeys) async {
    try {
      if (await _networkInfoController.isConnected) {
        print("SUB BODY ${body}");
      //  Map<dynamic,dynamic> hh = {};
        dynamic response = await ApiClient.RequestWithFile(
            url: ApiUrls.deilvery_signup,
            headerRequired: false,
            body: body,
            fileKey: fileKeys,
            files: files,
            magic_method_allow: false,
           // headerData: hh,
            method: Method.POST);
        return Left(response);
      } else {
        // return Left(ServerFailure());
        print("No nettttttttttttttttttttttwork");
        return Right(NoConnectionFailure());
      }
    } catch (err) {
      //  print("SUB BODY ${vendorModel.toJson()}");
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }

}