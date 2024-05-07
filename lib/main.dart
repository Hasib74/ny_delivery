import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapView/Controller/AppMapController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Network/network_info.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Local/DataSource/LocalDataSourceController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/AccountRecovery/Controller/AccountRecoveryController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/Login/Controller/LoginController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/OTP/Controller/OtpController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/Signup/Controller/SignupController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/Controller/DrawerMenHomeController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/MyCredentials/Controller/CredentialController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NewOrder/Controller/NewOrderController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NewOrder/Controller/OrderAcceptDeclineController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Notification/NotificationController/NotificationController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/PickCurrentLocation/Controller/PickCurrentLocationController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/ReadyToDelivery/Controller/PendingOrderController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/SplashScreen/Controller/SplashController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppTheme.dart';

import 'Core/Notification/NotificationService/NotificationService.dart';
import 'Data/Firebase/Repository/map_repository.dart';
import 'Presentation/Screen/ChooseCategory/Controller/HomePageController.dart';
import 'Presentation/Screen/DeliveredList/DeliveredListController/DeliveredListController.dart';
import 'Presentation/Screen/Menu/Controller/DrawerMenHomeController.dart';

// import 'package:map_location_picker/generated/l10n.dart' as location_picker;
import 'Core/Packages/google_map_location_picker-master/generated/l10n.dart'
    as location_picker;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'firebase_options.dart';

//demo data
String demo_image_url =
    "https://www.freeiconspng.com/thumbs/profile-icon-png/profile-icon-9.png";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.listenBackgroundNotificationMessage();

  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotificationService.listenNotificationMessage();
    NotificationService.listenForgroundNotificationMessage();

    Get.testMode = true;
    Get.put(LocalDataSourceController());
    Get.put(TokenController(), permanent: true);
    Get.put(SplashController());
    Get.put(NetworkInfoController());
    // push to dev
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => NewOrderController());
    Get.lazyPut(() => PendingOrderController());
    Get.lazyPut(() => OrderAcceptOrDelineController());
    Get.put(DrawerMenuHomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => CredentialController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => AccountRecoveryController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => PickCurrentLocationController());
    Get.put(NotificationController(), permanent: true);
    Get.put(DeliveredListController(), permanent: true);
    Get.put(MapRepository(), permanent: true);

    Get.put(AppMapController(), permanent: true)
      ..getCurrentLocation()
      ..setDeliveryManCurrentLocation();

    // Get.put(AppMapController() , permanent: true)..getCurrentLocation()..setDeliveryManCurrentLocation();

    return GetMaterialApp(
      localizationsDelegates: [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Delivery Man Module',
      getPages: AppRoutes.AppRoutesList(),
      initialRoute: AppRoutes.INITIAL,
    );
  }
}
