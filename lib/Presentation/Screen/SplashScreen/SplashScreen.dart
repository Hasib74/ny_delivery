import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/SplashScreen/Controller/SplashController.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(
      SplashController(),
      );

    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            child: Image.asset(
              AppAseets.icon,
              width: 40,
              height: 40,
            ),),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              child: SvgPicture.asset(
                AppAseets.fonts,
                width: 40,
                height: 40,
              ),
            ),
        ],
      ),
    );
  }
}
