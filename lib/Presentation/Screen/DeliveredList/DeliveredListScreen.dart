import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/FirebaseRepoManeger.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/NewOrderNotificationWidget.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppSpaces.dart';
import '../OrderDetails/OrderDetails.dart';
import 'DeliveredListController/DeliveredListController.dart';

class DeliveredListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(DeliveredListController());

    DeliveredListController.to.getDeliveredList();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          printInfo(info: "On refresh...");
          DeliveredListController.to.getDeliveredList();
          //  return true;
        },
        child: Container(
          child: Stack(
            children: [
              DeliveredList(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveredList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    DeliveredListController.to.getDeliveredList();
                  },
                  child: Positioned.fill(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: DeliveredListController
                                    .to.deliveryHistoryModel.value.message ==
                                null
                            ? 0
                            : DeliveredListController
                                .to.deliveryHistoryModel.value.message!.length,
                        itemBuilder: (context, index) {
                          var _history = DeliveredListController
                              .to.deliveryHistoryModel.value.message![index];

                          return NewOrderNotificationWidget(
                            acceptButtonAvailable: false,
                            delivery_location: _history.orderAddress ?? "",
                            price: _history.totalAmount ?? "",
                            customer_name: _history.customer!.fullName ?? "",
                            customer_number: _history.customer!.phone ?? "",
                            vendorName: _history.vendor!.fullName ?? "",
                            vendor_location: _history.vendor!.address ?? "",

                            view: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PhysicalModel(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  elevation: 0.5,
                                  color: AppColors.gray,
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              OrderDetailsDialog(
                                                  orderId: _history.id));
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                          child: Text(
                                        "Order Details >",
                                        style: Get.textTheme.headline6!
                                            .copyWith(fontSize: 14)
                                            .copyWith(color: AppColors.white),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //    customer_number: _history.or,
                            //   totalItem: _history.or,
                          );
                        }),
                  ),
                ),
                _isLoading(),
              ],
            )));
  }

  _isLoading() {
    return Obx(() => DeliveredListController.to.isLoading.value
        ? Positioned.fill(
            child: Align(
            alignment: Alignment.center,
            child: AppLoading(),
          ))
        : Container());
  }
}

/*
class MarkASRead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue,
      child: Icon(
      Icons.add,
      size: 100,),
    );
  }
}

class User {
    final int id;
    final String title;
    final String body;
    User(this.id,this.title,this.body,);
  }


*/
