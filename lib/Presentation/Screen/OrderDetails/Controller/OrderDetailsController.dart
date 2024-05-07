import 'dart:convert';

import 'package:get/get.dart';
import '../../../../Data/Model/order_details_model.dart';
import '../../../../Data/Repository/Repository/OrderDetailsRepository.dart';

class OrderDetailsController extends GetxController {
  static OrderDetailsController to = Get.find();

  RxBool loading = false.obs;

  OrderDetailsRepository _orderRepository = OrderDetailsRepository();

  Future<OrderDetailsModel> getOrderDetails(id) async {
    //loading.value = true;

    print("Order id  :: ${id}");

    OrderDetailsModel _orderDetails = new OrderDetailsModel();

    var _res = await _orderRepository.getOrderDetails(id);
    _res.fold((l) {
      printInfo(info: "Order details ::: 18388383 ${l.body}");

      _orderDetails = OrderDetailsModel.fromJson(jsonDecode(l.body));

      printInfo(
          info:
              "Order details ::: _orderDetails  ${_orderDetails.message!.orderDetails}");

      loading.value = false;
      // AppSnackBar.errorSnackbar(msg: "Failed to accept.");
    }, (r) {
      print("Right ==> ${r}");
      //   loading.value = false;
      //   getPickedItems();
    });

    return _orderDetails;
  }
}
