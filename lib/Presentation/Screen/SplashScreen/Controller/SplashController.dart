import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    TokenController.to.getToken();
    nextScreen();
  }
  nextScreen() async {
    new Future.delayed(const Duration(seconds: 2), () async {
      //    Get.toNamed(AppRoutes.SIGNUP);
      var token = await LocalDataSourceController.to.getToken();
      print("tokennnnnnnnnnnnnnnnnnnnnnnnnnnnn ${token}");

      if (token == null) {
        Get.toNamed(AppRoutes.LOGIN);
      } else {
        TokenController.to.token = token;
        ProfileController.to.getProfileInformation();
        Get.toNamed(AppRoutes.DRAWERMENHOMESCREEN);
      }
    });
  }
}
