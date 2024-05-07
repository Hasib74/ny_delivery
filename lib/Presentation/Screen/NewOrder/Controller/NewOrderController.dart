import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/OrderRepository.dart';

import '../../../../Data/Model/new_order.dart';

class NewOrderController extends GetxController {
  static NewOrderController to = Get.find();

  OrderRepository orderRepository = new OrderRepository();

  Rx<NewOrder> newOrder = new NewOrder().obs;
  RxBool isLoading = false.obs ;

  @override
  void onInit() {
    update();
    LocalDataSourceController.to.getToken();
    getNewOrders();

    super.onInit();
  }

  getNewOrders() async {


    isLoading(true) ;

    Either<dynamic, Failure>? response = await (orderRepository.newOrder() );

    response!.fold((l) {
      print("Left ===>  ${l.body}");

      newOrder.value = NewOrder.fromJson(jsonDecode(l.body));

      isLoading(false) ;


      // print("New Order value ===> ${newOrder.value.message[0].id}");
    }, (r) {

      isLoading(false) ;

      print("Right ${r}");
    });
  }
}
