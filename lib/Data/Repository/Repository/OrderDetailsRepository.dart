import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Core/DataSource/Remote/ApiClient.dart';
import '../../../Core/DataSource/Remote/ApiUrls.dart';
import '../../../Core/Error/failures.dart';
import '../../../Core/Network/network_info.dart';

class OrderDetailsRepository {
  NetworkInfoController _networkInfoController = Get.find();

  Future<Either<dynamic, Failure>> getOrderDetails(int? orderId) async {
    try {
      Map bodyData = {
        "id": orderId.toString(),
      };
      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
            url: "${ApiUrls.getOrderDetails}",
            enableHeader: true,
            method: Method.POST,
            body: jsonEncode(bodyData));

        print("URL is :: ${response}");
        print("Body is :: ${jsonEncode(bodyData)}");

        printInfo(info: "New Order details Response ::: ${response}");
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
