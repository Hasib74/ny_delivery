import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapView/map_view.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/FirebaseRepoManeger.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Notification/NotificationController/NotificationController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/NewOrderNotificationWidget.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppSpaces.dart';
import '../OrderDetails/OrderDetails.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // _load_profile_and_device_token();

    NotificationController.to.getNewOrderData(context);

    return Scaffold(
      body: Container(
        child: NewNotification(),
      ),
    );
  }

/*  Future<void> _load_profile_and_device_token(BuildContext context) async {
    if (ProfileController.to.profileInfoDetails.value.id == null) {
      Future.delayed(Duration(seconds: 2)).then((value) async {
        NotificationController.to.getNewOrderData(context);

        String _deviceToken = await FirebaseRepoManager.fbTokenRepository
            .getFirebaseDeviceToken();

        print("DeviceToken ............ ${_deviceToken}");
        ProfileController.to.saveDeviceToken(_deviceToken);

        NotificationController.to.getNewOrderData(context);

        // });
      });
    } else {
      NotificationController.to.getNewOrderData(context);
      String _deviceToken =
          await FirebaseRepoManager.fbTokenRepository.getFirebaseDeviceToken();

      print("DeviceToken ............ ${_deviceToken}");
      ProfileController.to.saveDeviceToken(_deviceToken);
    }
  }*/
}

class NewNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Stack(
              children: [
                Positioned.fill(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      NotificationController.to.getNewOrderData(context);
                    },
                    child: ListView.builder(
                        reverse: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: NotificationController
                                    .to.newOrderModel.value.response ==
                                null
                            ? 0
                            : NotificationController
                                .to.newOrderModel.value.response!.length,
                        itemBuilder: (context, index) {
                          var _newOrder = NotificationController
                              .to.newOrderModel.value.response![index];

                          return NewOrderNotificationWidget(
                            orderCode: _newOrder.orderCode,
                            customer_name:
                                "Customer Name: ${_newOrder.customer?.fullName}",
                            delivery_location:
                                "Delivery Location: ${_newOrder.customer?.address}",
                            price: "Price: ${_newOrder.paidAmount}",

                            customer_number:
                                "Customer Number: ${_newOrder.customer?.phone}",

                            onAccept: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Are you sure ? you want to delivery now"),
                                      actions: [
                                        InkWell(
                                          onTap: () async {
                                            bool _isSuccess =
                                                await NotificationController.to
                                                    .deliverOrder(
                                                        orderId: _newOrder.id
                                                            as int?);

                                            if (_isSuccess) {
                                              await NotificationController.to
                                                  .getNewOrderData(context);
                                            }

                                            Navigator.pop(context);
                                          },
                                          child: Obx(() =>
                                              NotificationController
                                                      .to.isLoading.value
                                                  ? SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: AppColors.green,
                                                      ),
                                                    )
                                                  : Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.green),
                                                    )),
                                        ),
                                        AppSpaces.spaces_height_20,
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "No",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        AppSpaces.spaces_height_15,
                                      ],
                                      contentPadding: EdgeInsets.only(
                                          top: 0, bottom: 0, right: 0, left: 0),
                                    );
                                  });
                            },
                            view: Row(
                              children: [
                                Spacer(),
                                Spacer(),
                                PhysicalModel(
                                  elevation: 0.5,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: AppColors.gray,
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) => AppMapView(
                                                    orderAddressLatLng: LatLng(
                                                        double.parse(_newOrder
                                                                .latValue ??
                                                            "0"),
                                                        double.parse(_newOrder
                                                                .longValue ??
                                                            "0")),
                                                  )));
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
                                        "View Map >",
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

                            //    customer_number: _newOrder.or,
                            //   totalItem: _newOrder.or,
                          );
                        }),
                  ),
                ),
                _isLoading(),
              ],
            )));
  }

  _isLoading() {
    return Obx(() => NotificationController.to.isLoading.value
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
