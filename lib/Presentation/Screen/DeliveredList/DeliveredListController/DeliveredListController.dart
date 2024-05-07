import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/NewOrderRemoteRepo.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/NewOrderRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Notification/Model/new_order_model.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';

import '../../../../Data/Model/DeliveryHistoryModel.dart';
import '../../../../Data/Repository/Remote/Repository/DeliveredListRepository.dart';

class DeliveredListController extends GetxController {
  // Rx<NewOrderModel> newOrderModel = new NewOrderModel().obs;

  RxBool isLoading = false.obs;

  Rx<DeliveryHistoryModel> deliveryHistoryModel =
      new DeliveryHistoryModel().obs;

  static DeliveredListController to = Get.find();
  DeliveredListRepository _deliveredListRepository =
      new DeliveredListRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getDeliveredList() async {
    isLoading(true);
    Either<dynamic, Failure> _res =
        await _deliveredListRepository.getDeliveredList();
    _res.fold((l) {
      printInfo(info: "getNewOrder ${l}");
      deliveryHistoryModel.value =
          DeliveryHistoryModel.fromJson(jsonDecode(l.body));
      isLoading(false);
    }, (r) {
      isLoading(false);
    });
  }
}
