import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/DataSource/FirebaseKey.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/Controller/DrawerMenHomeController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/MenuTitleEnum.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/DrawerButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/ImageViewWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../utils/AppAseets.dart';
import '../../utils/AppColors.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenuHomeController drawerMenuHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.6,
      height: Get.height,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: AppColors.drawerBackgroundColor,
        border: Border.all(color: AppColors.black),
      ),
      child: Obx(() => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _myProfileInfo(),
                _menuButtonList(),
              ],
            ),
          )),
    );
  }

  Widget _myProfileInfo() {
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppSpaces.spaces_height_15,
          Obx(() =>
              ProfileController.to.profileInfoDetails.value.response?.image ==
                      null
                  ? Container()
                  : Container(
                      width: 100,
                      height: 100,
                      child: ImageViewWidget(
                        imageType: ImageType.RING,
                        imageUrl: ApiUrls.download_base_url +
                            ProfileController
                                .to.profileInfoDetails.value.response!.image!,
                      ))),
          AppSpaces.spaces_height_10,
          Text(
            '${ProfileController.to.profileInfoDetails.value?.response?.fullName ?? "UnKnown"}',
            style:
                TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 10),
            color: AppColors.gray,
            width: Get.width,
            height: 1,
          )
        ],
      ),
    );
  }

  Widget _horizentalDividerine() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 10, top: 5),
      color: AppColors.gray,
      width: Get.width,
      height: 1,
    );
  }

  Widget _menuButtonList() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'My Profile',
              height: 30,
              icon: Icons.person,
              onTab: () {
                drawerMenuHomeController.menuTitleEnum.value =
                    MenuTitleEnum.PROFILE;
                drawerMenuHomeController.setDrawerMenuHomeScreen(
                    menuTitleEnum: MenuTitleEnum.PROFILE);
                Get.back();
              }),
        ),
        _horizentalDividerine(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'Orders',
              icon: Icons.table_rows_outlined,
              height: 30,
              onTab: () {
                drawerMenuHomeController.menuTitleEnum.value =
                    MenuTitleEnum.ORDERS;
                drawerMenuHomeController.setDrawerMenuHomeScreen(
                    menuTitleEnum: MenuTitleEnum.ORDERS);
                Get.back();
              }),
        ),
        _horizentalDividerine(),
        /* Padding(
          padding: EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'Need to picked',
              icon: Icons.message_outlined,
              height: 30,
              onTab: () {
                drawerMenuHomeController.menuTitleEnum.value =
                    MenuTitleEnum.NEED_TO_PICKED_ITEM;
                drawerMenuHomeController.setDrawerMenuHomeScreen(
                    menuTitleEnum: MenuTitleEnum.NEED_TO_PICKED_ITEM);
                Get.back();
              }),
        ),*/
        //  _horizentalDividerine(),
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: DrawerButtonWidget(
        //         title: 'Ready to delivery',
        //         icon: Icons.message_outlined,
        //         height: 30,
        //         onTab: () {
        //           drawerMenuHomeController.menuTitleEnum.value =
        //               MenuTitleEnum.READY_TO_DELIVERY;
        //           drawerMenuHomeController.setDrawerMenuHomeScreen(
        //               menuTitleEnum: MenuTitleEnum.READY_TO_DELIVERY);
        //           Get.back();
        //         }),
        //   ),
        //   _horizentalDividerine(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'Delivery History',
              icon: Icons.history,
              height: 30,
              onTab: () {
                drawerMenuHomeController.menuTitleEnum.value =
                    MenuTitleEnum.DELIVERY_HISTORY;
                drawerMenuHomeController.setDrawerMenuHomeScreen(
                    menuTitleEnum: MenuTitleEnum.DELIVERY_HISTORY);
                Get.back();
              }),
        ),
        /* _horizentalDividerine(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'Is Available',
              icon: Icons.message_outlined,
              height: 30,
              onTab: () {
                drawerMenuHomeController.menuTitleEnum.value =
                    MenuTitleEnum.IS_AVAILABLE;
                drawerMenuHomeController.setDrawerMenuHomeScreen(
                    menuTitleEnum: MenuTitleEnum.IS_AVAILABLE);
                Get.back();
              }),
        ),*/
        // _horizentalDividerine(),
        // Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: DrawerButtonWidget(
        //       title: "My Credentials",
        //       icon: Icons.credit_card,
        //       onTab: () {
        //         print('my credentials information');
        //         drawerMenuHomeController.menuTitleEnum.value =
        //             MenuTitleEnum.MY_CREDENTIALS;
        //         drawerMenuHomeController.setDrawerMenuHomeScreen(
        //             menuTitleEnum: MenuTitleEnum.MY_CREDENTIALS);
        //         Get.back();
        //       }),
        // ),
        // Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: DrawerButtonWidget(
        //       title: 'Reponse Rate',
        //       icon: Icons.message_outlined,
        //       height: 30,
        //       onTab: () {
        //         drawerMenuHomeController.menuTitleEnum.value =
        //             MenuTitleEnum.IS_AVAILABLE;
        //         drawerMenuHomeController.setDrawerMenuHomeScreen(
        //             menuTitleEnum: MenuTitleEnum.IS_AVAILABLE);
        //         Get.back();
        //       }),
        // ),
        _horizentalDividerine(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'Logout',
              icon: Icons.logout,
              height: 30,
              onTab: () async {
                //Get.rem(AppRoutes.LOGIN);

                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.remove(TOKEN).then((value) {
                  Get.offAllNamed(AppRoutes.LOGIN);
                });
              }),
        ),

        AppSpaces.spaces_height_15,

        Padding(
          padding: EdgeInsets.all(8.0),
          child: DrawerButtonWidget(
              title: 'Delete Account',
              icon: Icons.delete,
              height: 30,
              onTab: () async {
                //Get.rem(AppRoutes.LOGIN);

                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.remove(TOKEN).then((value) {
                  Get.offAllNamed(AppRoutes.LOGIN);
                });
              }),
        ),

        _horizentalDividerine(),
      ],
    );
  }
}
