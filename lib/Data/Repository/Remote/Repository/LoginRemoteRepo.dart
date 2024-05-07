import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiClient.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Network/network_info.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

NetworkInfoController _networkInfoController = Get.find();

class LoginRemoteRepo {
  Future<Either<dynamic, Failure>> login(body) async {
    try {
      if (await _networkInfoController.isConnected) {
        print("======================");
        print("Log in SUB BODY ${body}");
        print("Log in SUB URL ${ApiUrls.deilvery_login}");
        print("======================");

        dynamic response = await ApiClient.Request(
            url: ApiUrls.deilvery_login,
            enableHeader: false,
            body: body,
            method: Method.POST);

        print("======================");
        print("Log in SUB RES ${response.body}");
        print("======================");

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
