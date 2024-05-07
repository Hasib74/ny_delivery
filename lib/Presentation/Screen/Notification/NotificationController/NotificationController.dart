import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/DataSource/FirebaseKey.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/NewOrderRemoteRepo.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/NewOrderRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Notification/Model/new_order_model.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';

import '../../../../Data/_Token/TokenController.dart';

class NotificationController extends GetxController {
  Rx<NewOrderModel> newOrderModel = new NewOrderModel().obs;

  RxBool isLoading = false.obs;

  static NotificationController to = Get.find();
  NewOrderRepo _newOrderRepo = NewOrderRemoteRepo();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future getNewOrderData(BuildContext context) async {
    isLoading(true);

    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token.toString()}'
    };

    var _response = await http
        .get(Uri.parse("${ApiUrls.base_url}current-order"), headers: _header);

    newOrderModel.value =
        new NewOrderModel.fromJson(jsonDecode(_response.body));

    isLoading(false);

    return;
  }

  deliverOrder({required int? orderId}) async {
    isLoading(true);

    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token.toString()}'
    };
    var _body = {
      "order_status": 30,
      // "delivery_man_id":
      //     ProfileController.to.profileInfoDetails.value.response.deliveryMenId,
      "id": orderId
    };

    var _response = await http.post(
        Uri.parse(
            "${ApiUrls.download_base_url}api/delivary-order-status-update"),
        body: jsonEncode(_body),
        headers: _header);

    isLoading(false);

    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  orderDelivery(
      {required delivery_man_id,
      required order_id,
      required order_status}) async {
    isLoading(true);
    Either<http.Response, Failure>? _res = await (_newOrderRepo.acceptOrder(
        delivery_man_id: delivery_man_id,
        order_id: order_id,
        orderStatus: order_status));

    //  getNewOrderData();
    _res!.fold((l) {
      printInfo(info: l.body);

      _saveOrderToFirebase(order_id, delivery_man_id);

      newOrderModel(NewOrderModel.fromJson(jsonDecode(l.body)));

      isLoading(false);
    }, (r) {
      isLoading(false);
    });
  }

  void _saveOrderToFirebase(order_id, delivery_man_id) {
    FirebaseDatabase.instance
        .ref(FirebaseKey.ACTIVE_ORDER)
        .child(order_id.toString())
        .update({
      FirebaseKey.ORDER_ID: order_id,
      FirebaseKey.DELIVERY_MAN_ID:
          ProfileController.to.profileInfoDetails.value.response!.deliveryMenId,
      FirebaseKey.STATUS: "ready_to_pickup"
    });
  }
}
