import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Controlller/AppLoadingController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppBackgroundWidget extends StatelessWidget {
  Widget? child;

  AppBackgroundWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
          //      header_logo(),
            //    app_logo(),
                Expanded(child: child!),
              ],
              ),
               GetBuilder<AppLoadingController> (
                 init: AppLoadingController()..setLoading(),
                 builder: (_) {
                   return _.isLoading! ? _loading() : Container();
                 },
               )
          ],
        ),
      ),
    );
  }

  Container header_logo() {
    return Container (
      width: double.infinity,
      child: Image.asset(AppAseets.header),
    );
  }

  Container app_logo() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 120,
      width: 300,
     // child: Image.asset(AppAseets.header),
    );
  }

  _loading() {
    return Align(
      alignment: Alignment.center,
      child: SpinKitSquareCircle( 
        color: AppColors.orange,
        size:50,
      ),
    );
  }
}