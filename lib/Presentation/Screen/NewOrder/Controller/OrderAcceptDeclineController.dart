import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';

import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/OrderRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/OrderRemoteRepo.dart';

import '../../../../Data/Model/new_order.dart';

class OrderAcceptOrDelineController extends GetxController {
   static OrderAcceptOrDelineController to = Get.find();


 
  OrderRepository orderRepository = new OrderRepository();
  
  OrderRemoteRepo orderRemoteRepo = new OrderRemoteRepo();


  Rx<NewOrder> newOrder = new NewOrder().obs;

   NewOrder? selectedOptionAccept;
   NewOrder? selectedOptionDecline;

  RxBool loading = false.obs;

  @override
  void onInit() {
    update();
     print("callllllllllllllllllllllll.............");
    LocalDataSourceController.to.getToken();
    print("===================${selectedOptionAccept}");
 
    getNewOrders();
     orderAccept();
    super.onInit();
  }

  updateUI() async {
    newOrder = await getNewOrders();
    update();
  }
  getNewOrders() async {
    Either<dynamic, Failure>? response = await (orderRepository.newOrder() );

    response!.fold((l) {
      print("Left ===>  ${l.body}");

      newOrder.value = NewOrder.fromJson(jsonDecode(l.body));

     // print("New Order value ===> ${newOrder.value.message![0].id}");
    }, (r) {
      print("Right ${r}");
    });
  }

  orderAccept() async {
    loading.value = true;
    if (selectedOptionAccept == null) {
      print("noooooooooo accept api is call");
      getNewOrders();
    }else {
      dynamic response = await orderRemoteRepo.orderAccept(selectedOptionAccept);
      print("okeyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy........${response}");
      if( jsonDecode(response.body)["status_code"].toString().endsWith("200")) {
        selectedOptionAccept == null;

        updateUI();
        AppSnackBar.successSnackbar(msg: "Accept successfully");
        getNewOrders();
        // loading.value = false;
      
      }
    }
  }

  orderDecline() async {
    loading.value = true;
    if (selectedOptionDecline == null) {
      getNewOrders();
    }else{
      dynamic response = await orderRemoteRepo.orderDecline(selectedOptionDecline);
      print("declineeeeeeeeeeee=============== ${response}");
      if(jsonDecode(response.body)["status_code"].toString().endsWith("200")) {
        selectedOptionDecline == null;
         updateUI();
        AppSnackBar.successSnackbar(msg: "Decline successfully");
      //  loading.value = false;
      }

    }
  }


}
