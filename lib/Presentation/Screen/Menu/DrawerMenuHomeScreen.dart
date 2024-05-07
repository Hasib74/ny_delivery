import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapView/Controller/AppMapController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/Controller/DrawerMenHomeController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/DrawerMenu.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/MenuTitleEnum.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/MyCredentials/MyCredentialScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NeedToPickedItem/ItemPicked.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/DeliveryManProfileScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';
import '../../../Data/Firebase/Repository/map_repository.dart';
import '../../utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Notification/NotificationScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NewOrder/NewOrderScreen.dart';

import '../DeliveredList/DeliveredListController/DeliveredListController.dart';
import '../DeliveredList/DeliveredListScreen.dart';
import '../DeliveryHistory/DeliveryHistoryScreen.dart';
import '../Notification/NotificationController/NotificationController.dart';
import '../ReadyToDelivery/PendingOrder.dart';

class DrawerMenuHomeScreen extends StatefulWidget {
  @override
  _DrawerMenuHomeScreenState createState() => _DrawerMenuHomeScreenState();
}

class _DrawerMenuHomeScreenState extends State<DrawerMenuHomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppMapController.to.setDeliveryManCurrentLocation();

    return WillPopScope(
      onWillPop: () async {
        if (DrawerMenuHomeController.to.menuTitleEnum.value !=
            MenuTitleEnum.ORDERS) {
          DrawerMenuHomeController.to.menuTitleEnum.value =
              MenuTitleEnum.ORDERS;

          return false;
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Do you want to exit ?"),
                  actions: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(color: AppColors.green),
                        )),
                    AppSpaces.spaces_width_25,
                    InkWell(
                        onTap: () {
                          exit(0);
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                );
              });

          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.orange,
          title: Obx(() => Text(
                DrawerMenuHomeController.to.menuTitleEnum.value
                    .toString()
                    .replaceAll("_", " ")
                    .replaceAll("MenuTitleEnum.", ""),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              )),
        ),
        drawer: DrawerMenu(),
        body: Container(
            height: Get.height,
            width: Get.width,
            child: Obx(() {
              switch (DrawerMenuHomeController.to.menuTitleEnum.value) {
                case MenuTitleEnum.PROFILE:
                  return DeliveryManProfileScreen();
                  break;
                case MenuTitleEnum.ORDERS:
                  //DeliveredListController.to.getNewOrderData();
                  return NotificationScreen();
                  break;
                case MenuTitleEnum.DELIVERY_HISTORY:
                  //DeliveredListController.to.getNewOrderData();

                  return DeliveryManHistoryScreen();
                  break;
                // case MenuTitleEnum.NEWorder:
                //   return NewOrderScreen();
                //   break;
                case MenuTitleEnum.READY_TO_DELIVERY:
                  return PendingOrder();
                  break;
                case MenuTitleEnum.MY_CREDENTIALS:
                  return MyCredentialsScreen();
                case MenuTitleEnum.NEED_TO_PICKED_ITEM:
                  return ItemPickedScreen();
                  break;
                default:
                  return NotificationScreen();
              }
            })),
      ),
    );
  }
}
