import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/NewOrderNotificationWidget.dart';
import '../../Widgets/NewOrderWidget.dart';
import 'Controller/DeliveryHistoryController.dart';

class DeliveryManHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryHistoryController());
    DeliveryHistoryController.to.getDeliveryManHistory();

    return Obx(
      () => Container(
        width: Get.width,
        height: Get.height,
        child: _screen_view(),
      ),
    );
  }

  Widget _screen_view() {
    Widget child;

    if (DeliveryHistoryController.to.historyModel.value.message == null) {
      child = Center(child: Text("Loading ..."));
    } else if (DeliveryHistoryController
        .to.historyModel.value.message!.isEmpty) {
      child = Center(
        child: Text("Data not found."),
      );
    } else {
      child = ListView.builder(
        itemCount:
            DeliveryHistoryController.to.historyModel.value.message?.length,
        itemBuilder: (context, int index) {
          var history =
              DeliveryHistoryController.to.historyModel.value.message![index];

          return NewOrderNotificationWidget(
            acceptButtonAvailable: false,
            customer_name: "Customer Name: ${history.customer?.fullName}",
            delivery_location:
                "Delivery Location: ${history.customer?.address}",
            price: "Price: ${history.paidAmount}",
            orderCode: history.orderCode,
          );
        },
      );
    }

    return child;
  }
}
