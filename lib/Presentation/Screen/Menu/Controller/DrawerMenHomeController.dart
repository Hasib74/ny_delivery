import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Model/delivery_man_profile.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/ProfileRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/MenuTitleEnum.dart';
import 'package:dartz/dartz.dart';

class DrawerMenuHomeController extends GetxController {
  ProfileRepository _profileRepository = new ProfileRepository();

  Rx<DeliveryManProfile>? deliveryManProfileInfo = new DeliveryManProfile().obs;

  static DrawerMenuHomeController get to => Get.find();
  Rx<MenuTitleEnum> menuTitleEnum = MenuTitleEnum.ORDERS.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    setDrawerMenuHomeScreen(menuTitleEnum: MenuTitleEnum.ORDERS);
  }

  setDrawerMenuHomeScreen({required MenuTitleEnum menuTitleEnum}) async {
    print("calling drawer menu ui");
    deliveryManProfileInfo?.value =
        (await _profileRepository.loadDeliveryManProfileInformation())!;

    ///this.menuTitleEnum = menuTitleEnum;
  }
}
