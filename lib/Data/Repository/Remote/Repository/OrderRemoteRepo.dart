import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiClient.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Network/network_info.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../Presentation/Screen/Profile/Controller/ProfileController.dart';
import '../../../Firebase/DataSource/FirebaseKey.dart';

class OrderRemoteRepo {
  NetworkInfoController _networkInfoController = Get.find();

  Future<Either<dynamic, Failure>> newOrder() async {
    try {
      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
            url: ApiUrls.getAllNewOrder,
            enableHeader: true,
            method: Method.GET);
        printInfo(info: "New Order Response ::: ${response}");
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

  Future<dynamic> orderAccept(orderId) async {
    bool result = false;
    Map<String, dynamic> bodyData = {
      "id": orderId.id,
    };
    try {
      if (await _networkInfoController.isConnected) {
        http.Response? response = await (ApiClient.Request(
            url: ApiUrls.acceptOrder,
            body: jsonEncode(bodyData),
            enableHeader: true,
            method: Method.POST));
        if (jsonDecode(response!.body)["error"] != null) {
          print("Error on api");
          Get.snackbar(
            "Error !!!",
            response.body.toString(),
          );
        } else {
          print("api done");
          print("iddddddddd...check ${orderId.id}");
          return response;
        }
      } else {
        print("Noooooooooo Network");
      }
    } catch (err) {
      print("Error : ${err}");
    }
  }

  Future<dynamic> orderDecline(orderId) async {
    bool result = false;
    Map<String, dynamic> bodyData = {
      "id": orderId.id,
    };
    try {
      if (await _networkInfoController.isConnected) {
        http.Response? response = await (ApiClient.Request(
            url: ApiUrls.declineOrder,
            body: jsonEncode(bodyData),
            enableHeader: true,
            method: Method.POST));
        if (jsonDecode(response!.body)["error"] != null) {
          print("Error on APi");
          Get.snackbar(
            "Error !!!",
            response.body.toString(),
          );
        } else {
          print("api done");
          print("iddddddddd...check ${orderId.id}");
          return response;
        }
      } else {
        print("Nooooo  Network...........");
      }
    } catch (err) {
      print("Error : ${err}");
    }
  }

  Future<Either<dynamic, Failure>> pendingOrder() async {
    try {
      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
            // url: ApiUrls.pendingOrder,
            url: ApiUrls.picked_order,
            enableHeader: true,
            method: Method.GET);
        print("Pending Order response......... ${response}");
        return Left(response);
      } else {
        print("No Netork..............please connect with network");
        return Right(NoConnectionFailure());
      }
    } catch (err) {
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }

  Future<Either<dynamic, Failure>> orderPickedFromVendor(Map body) async {
    try {
      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
          // url: ApiUrls.pendingOrder,
          url: ApiUrls.orderItemPickFromVendor,
          enableHeader: true,
          method: Method.POST,
          body: jsonEncode(body),
        );
        print("Pending Order response......... ${response}");
        return Left(response);
      } else {
        print("No Netork..............please connect with network");
        return Right(NoConnectionFailure());
      }
    } catch (err) {
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }

  Future<dynamic> itemPickFromRestaurant(orderId) async {
    bool result = false;
    Map<String, dynamic> bodyData = {
      "id": orderId.id,
    };
    try {
      if (await _networkInfoController.isConnected) {
        http.Response? response = await (ApiClient.Request(
            url: ApiUrls.itemPickFromVendor,
            body: jsonEncode(bodyData),
            enableHeader: true,
            method: Method.POST));
        if (jsonDecode(response!.body)["error"] != null) {
          print("Error on api");
          Get.snackbar(
            "Error !!!",
            response.body.toString(),
          );
        } else {
          print("api done");
          print("iddddddddd...check ${orderId.id}");
          return response;
        }
      } else {
        print("Noooooooooo Network");
      }
    } catch (err) {
      print("Error : ${err}");
    }
  }

  Future<dynamic> deliveredOrderToCustomer(int? id) async {
    bool result = false;
    Map<String, dynamic> bodyData = {
      "id": id,
    };
    try {
      if (await _networkInfoController.isConnected) {
        http.Response? response = await (ApiClient.Request(
            url: ApiUrls.completedOrder,
            body: jsonEncode(bodyData),
            enableHeader: true,
            method: Method.POST));

        if (jsonDecode(response!.body)["error"] != null) {
          print("error on api");
          Get.snackbar("Error !!!", response.body.toString());
        } else {
          print("api done.........");

          FirebaseDatabase.instance
              .ref(FirebaseKey.ACTIVE_ORDER)
              .child(id.toString())
              .update({
            FirebaseKey.ORDER_ID: id,
            FirebaseKey.DELIVERY_MAN_ID: ProfileController
                .to.profileInfoDetails.value.response!.deliveryMenId,
            FirebaseKey.STATUS: "delivered"
          });

          return response;
        }
      } else {
        print("N00000000 Network.......");
      }
    } catch (err) {
      print("Error : ${err}");
    }
  }

  Future<Either<dynamic, Failure>> getOrderDetailsProductList(
      int? orderId) async {
    try {
      /* Map<String, dynamic> bodyData = {
        "id": orderId,
      };*/
      if (await _networkInfoController.isConnected) {
        dynamic response = await ApiClient.Request(
            url: ApiUrls.getOrderProductList + "${orderId}",
            enableHeader: true,
            method: Method.GET);
        printInfo(
            info: "New Order details productlist Response ::: ${response}");
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
