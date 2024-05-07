//import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }

class NetworkInfoController extends GetxController {
  static NetworkInfoController to = Get.find();
 // DataConnectionChecker dataConnectionChecker = new DataConnectionChecker();

  Future<bool> get isConnected => Future.value(true) ;// dataConnectionChecker.hasConnection;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   // print("checking code : ${dataConnectionChecker.hasConnection}");
  }
}
