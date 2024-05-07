import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void errorSnackbar({required String msg}) {
     Get.snackbar('$msg', "Error !",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.deepOrange[200],
        icon: Icon(Icons.error),
        duration: Duration(seconds: 4),
        colorText: Colors.white);
  }

  static void successSnackbar({required String msg}) {
     Get.snackbar('$msg', "Success !",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[200],
        icon: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
        ),
        colorText: Colors.white);
  }
}
