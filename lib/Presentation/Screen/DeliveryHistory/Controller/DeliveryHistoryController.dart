import 'dart:convert';

import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Model/new_order.dart';

import '../../../../Core/DataSource/Remote/ApiClient.dart';
import '../../../../Core/DataSource/Remote/ApiUrls.dart';
import 'package:http/http.dart' as http;

import '../../../../Data/_Token/TokenController.dart';
import '../Model/delivery_history_model.dart';

class DeliveryHistoryController extends GetxController {
  static DeliveryHistoryController to = Get.find();

  Rx<DeliveryHistoryModel> historyModel = new DeliveryHistoryModel().obs;

  RxBool loading = false.obs;

  getDeliveryManHistory() async {
    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token.toString()}'
    };

    http.Response _response =
        await http.get(Uri.parse(ApiUrls.orderHistory), headers: _header);
    printInfo(info: "New Order Response ::: ${_response.body}");

    if (_response.statusCode == 200) {
      historyModel.value = DeliveryHistoryModel.fromJson(jsonDecode(_response.body));

      update();
    } else {
      AppSnackBar.errorSnackbar(msg: "Status Code : ${_response.statusCode}");
    }
  }
}
