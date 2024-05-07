import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/FirebaseRepoManeger.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/Repository/map_repository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/RingButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';

class ChooseCategory extends StatefulWidget {
  @override
  _ChooseCategoryState createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  /*ProfileController*/
  @override
  Widget build(BuildContext context) {
    print("ChooseCategory....................................................");
    ProfileController.to.getProfileInformation().then((value) async {
      String _deviceToken =
          await FirebaseRepoManager.fbTokenRepository.getFirebaseDeviceToken();

      print("DeviceToken ............ ${_deviceToken}");
      ProfileController.to.saveDeviceToken(_deviceToken);
    });

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: SafeArea(
            child: Column(
          children: [
            Spacer(),
            Spacer(),
            logo(),
            AppSpaces.spaces_height_20,
            title(),
            Spacer(),
            orderFood_grocery_catering(),
            Spacer(),
            //   menu_reward_accountorder(),
            // Spacer(),
          ],
        )),
      ),
    );
  }

  Container logo() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
          padding: EdgeInsets.all(8.0), child: Image.asset(AppAseets.icon)),
    );
  }

  Text title() {
    return Text(
      "Fast and reliable doorstep delivery",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
    );
  }

  // Row menu_reward_accountorder() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       AppSpaces.spaces_width_5,
  //       RectangleButtonWidget(
  //         assetIcon:AppAseets.menuIcon,
  //         title:'Menu',
  //         onClick: () => Get.toNamed(AppRoutes.MENU),
  //       ),

  //       AppSpaces.spaces_width_5,
  //       RectangleButtonWidget(
  //         assetIcon: AppAseets.rewardsIcon,
  //         title: 'Reward',
  //         onClick: () => Get.toNamed(AppRoutes.REWARD),
  //       ),

  //       AppSpaces.spaces_width_5,
  //       RectangleButtonWidget(
  //         assetIcon: AppAseets.accountIcon,
  //         title: 'Account',
  //         onClick: () => Get.toNamed(AppRoutes.LOGIN),
  //       ),

  //       AppSpaces.spaces_width_5,
  //       RectangleButtonWidget(
  //         assetIcon: AppAseets.myOrderIcon,
  //         title: 'My Order'
  //       ),
  //     AppSpaces.spaces_width_5,

  //     ],
  //   );
  // }

  Widget orderFood_grocery_catering() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            child: RingButtonWidget(
                title: 'Order Food', iconAsset: AppAseets.orderFoodIcon),
            onTap: () {
              // Get.toNamed(AppRoutes.DRAWERMENHOMESCREEN);
              // Get.toNamed(AppRoutes.PHONENUMBERAUTH);
              Get.toNamed(AppRoutes.LOGIN);
            },
          ),
          InkWell(
            child: RingButtonWidget(
                title: 'Catering', iconAsset: AppAseets.cateringIcon),
            onTap: () {
              Get.toNamed(AppRoutes.LOGIN);
            },
          ),
          InkWell(
            child: RingButtonWidget(
                title: 'Grocery', iconAsset: AppAseets.groceryIcon),
            onTap: () {
              Get.toNamed(AppRoutes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
