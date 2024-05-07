import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/ReadyToDelivery/Controller/PendingOrderController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';

import 'AppButtonWidget.dart';

class PendingOrderWidget extends StatelessWidget {
  final vendorName;

  final shopName;

  final customerName;

  final vendorAddress;

  final vendorPhone;

  final customerAddress;

  final customerPhone;

  final statusId;

  final index;

  final orderAddress ;

  final Widget? view;

  final VoidCallback? onDeliverOrder;

  PendingOrderWidget(
      {required this.shopName,
      required this.customerAddress,
      required this.vendorAddress,
      required this.vendorName,
      required this.index,
      required this.customerName,
      required this.customerPhone,
      required this.statusId,
      required this.vendorPhone,
      required this.orderAddress,
      this.onDeliverOrder,
      this.view});

  @override
  Widget build(BuildContext context) {
    printInfo(info: "vendorPhone ::: ${vendorPhone}");
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Container(
            // height: 180,
            width: Get.width,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 10,
                    blurRadius: 10,
                  )
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width / 2 - 5,
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        'Pick from : \nName: ${vendorName}\nShop Name: ${shopName}\nAddress: ${vendorAddress}\nPhone: ${vendorPhone}',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                      ),
                    ),
                    Container(
                      width: Get.width / 2 - 5,
                      padding: EdgeInsets.only(right: 10, top: 5),
                      child: Text(
                        'Delivery to : \nName: ${customerName}\nAddress: ${orderAddress}\nPhone: ${customerPhone}',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                if (view != null) view!,
                AppSpaces.spaces_height_15,
                statusId == 3
                    ? Container(
                        alignment: Alignment.center,
                        child: AppButtonWidget(
                            title: 'Item Pick From Restaurant',
                            font_size: 15,
                            width: 220,
                            leadingCenter: true,
                            backgroundColor: AppColors.orange,
                            onTab: () {
                              print(
                                  "item pick from restaurant ==================================> ${PendingOrderController.to.pendingOrder.value.message![index]}");

                              PendingOrderController.to
                                  .itemPickFromRestaurant();
                            }),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: AppButtonWidget(
                            title: 'Delivered Order',
                            font_size: 15,
                            width: 220,
                            leadingCenter: true,
                            backgroundColor: AppColors.orange,
                            onTab: onDeliverOrder),
                      ),
                AppSpaces.spaces_height_5,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
