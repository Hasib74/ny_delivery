library fb_token_repository ;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/DataSource/FirebaseKey.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';

@protected
class  FBTokenRepository {
  String _TAG = "FBTokenRepository";
   @protected
    tokenGetAndSendToFirebaseDB() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("${_TAG} token is : ${value}");
      FirebaseDatabase.instance
          .reference()
          .child(FirebaseKey.DEVICE_TOKEN)
          .child(FirebaseKey.VENDOR)
          .child(ProfileController.to.profileInfoDetails.value.response!.phone!)
          .set({FirebaseKey.TOKEN: value});
    });
  }

  getFirebaseDeviceToken() async {
    String? _token = await FirebaseMessaging.instance.getToken();

    print("Device token is :: ${_token}");
    return _token;
  }
}
