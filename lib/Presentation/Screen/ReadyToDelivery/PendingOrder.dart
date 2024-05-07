import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/ReadyToDelivery/Controller/PendingOrderController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/ReadyToDelivery/Map/ready_to_delivery_map_view.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/PendingOrderWidget.dart';

import '../../utils/AppColors.dart';
import '../NeedToPickedItem/Controller/ItemPcikedController.dart';
import '../OrderDetails/OrderDetails.dart';

class PendingOrder extends StatefulWidget {
  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    PendingOrderController.to.getPendingOrders();
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Stack(
            children: [
              _body(),
              _loading(),
            ],
          ),
        ),
      ),
    );
  }

  _loading() {
    if (PendingOrderController.to.loading.value) {
      return Positioned.fill(
          child: Center(
        child: AppLoading(),
      ));
    } else {
      return Container();
    }
  }

  _body() {
    return Obx(() {
      print("Pending order :: ${PendingOrderController.to.pendingOrder}");


      if (PendingOrderController.to.pendingOrder.value.message == null) {
        return Container();
      } else
        return RefreshIndicator(
          onRefresh: () async {
            PendingOrderController.to.getPendingOrders();
          },
          child: ListView.builder(
            itemCount:
                PendingOrderController.to.pendingOrder.value.message!.length ??
                    0,
            itemBuilder: (context, int index) {
              var _order =
                  PendingOrderController.to.pendingOrder.value.message![index];

              print("Pending order phone number :: ${_order.vendor!.phone}");

              return PendingOrderWidget(
                shopName:  _order.vendor!.shopName,
                statusId: "Status",
                customerAddress: _order.customer!.address,
                customerName: _order.customer!.fullName,
                customerPhone: _order.customer!.phone,
                vendorAddress: _order.vendor!.address,
                vendorName: _order.vendor!.fullName,
                vendorPhone:_order.vendor!.phone,
                orderAddress:  _order.orderAddress,
                index: index,
                view: Padding(
                  padding: const EdgeInsets.only(right: 16 , top: 16 , bottom: 16),
                  child: Row(
                    children: [
                      Spacer(),
                      Spacer(),
                      InkWell(

                        onTap: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      NeedToDeliveryUpMapView(
                                        orderAddress: LatLng(
                                            double.parse(
                                                PendingOrderController
                                                    .to
                                                    .pendingOrder
                                                    .value
                                                    .message![index]
                                                    .orderAddressLatValue
                                                    .toString()),
                                            double.parse(
                                                PendingOrderController
                                                    .to
                                                    .pendingOrder
                                                    .value
                                                    .message![index]
                                                    .orderAddressLongValue
                                                    .toString()),),
                                        // vendorLocation: LatLng(
                                        //   double.parse(
                                        //       ItemPickedController
                                        //           .to
                                        //           .pickedItemModel
                                        //           .value
                                        //           .message[index]
                                        //           .vendor
                                        //           .latValue
                                        //           .toString()),
                                        //   double.parse(
                                        //       ItemPickedController
                                        //           .to
                                        //           .pickedItemModel
                                        //           .value
                                        //           .message[index]
                                        //           .vendor
                                        //           .longValue
                                        //           .toString()),
                                        // ),
                                      )));

                        },
                        child: PhysicalModel(

                          elevation: 0.5,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.gray,
                          child: Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text(
                              "View Map >",
                              style: Get.textTheme.headline6!
                                  .copyWith(fontSize: 14)
                                  .copyWith(color: AppColors.white),
                            )),
                          ),
                        ),
                      ),
                      Spacer(),
                      PhysicalModel(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        elevation: 0.5,
                        color: AppColors.gray,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    OrderDetailsDialog(orderId: _order.id));
                          },
                          child: Container(
                            width: 120,
                            height: 30,
                            decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
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
                      Spacer(),
                      Spacer(),
                    ],
                  ),
                ),
                onDeliverOrder: () {
                  PendingOrderController.to.deliveredOrderToCustomer(_order.id);
                },
              );
            },
          ),
        );
    });
  }
}
