import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Model/new_order.dart';

import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/OrderRemoteRepo.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/OrderRepository.dart';

import '../../../../Data/Model/ReadyToDeliveryModel.dart';

class PendingOrderController extends GetxController {
  static PendingOrderController to = Get.find();

  OrderRepository orderRepository = new OrderRepository();

  OrderRemoteRepo orderRemoteRepo = new OrderRemoteRepo();

  Rx<ReadyToDeliveryHistoryModel> pendingOrder = new ReadyToDeliveryHistoryModel().obs;

  NewOrder? selectItemPickFromRestaurant;
  NewOrder? deliveredToCustomer;

  RxBool loading = false.obs;

  @override
  void onInit() {
    LocalDataSourceController.to.getToken();
    getPendingOrders();

    super.onInit();
  }

  getPendingOrders() async {
    loading(true);
    print("Loading getPendingOrders");
    Either<dynamic, Failure>? response = await (orderRepository.pendingOrder() );
    response!.fold((l) {
      print("Left =====> ${l.body}");
      pendingOrder.value = ReadyToDeliveryHistoryModel.fromJson(jsonDecode(l.body));

      loading(false);

      //print("Pending order value ========> ${pendingOrder.value.message[0].id}");
    }, (r) {
      print("Right ${r}");
      loading(false);
    });
  }

  itemPickFromRestaurant() async {
    loading.value = true;
    if (selectItemPickFromRestaurant == null) {
      print("Item pick from restaurant is not callllllllllllllllll");
      getPendingOrders();
    } else {
      dynamic response = await orderRemoteRepo
          .itemPickFromRestaurant(selectItemPickFromRestaurant);
      print("okeyyyyyyyyyyyyyyyyy .............${response}");
      if (jsonDecode(response.body)["status_code"].toString().endsWith("200")) {
        selectItemPickFromRestaurant == null;

        getPendingOrders();
        AppSnackBar.successSnackbar(
            msg: "Successfully Item Picked from restaurant");
      }
    }
  }

  deliveredOrderToCustomer(int? id) async {
    loading.value = true;
    dynamic response = await orderRemoteRepo.deliveredOrderToCustomer(id);
    print("okey..................${response}");
    if (jsonDecode(response.body)["status_code"].toString().endsWith("200")) {
      getPendingOrders();
      AppSnackBar.successSnackbar(msg: "Delivered to customer");
    }
  }
}
