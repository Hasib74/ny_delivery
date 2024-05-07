import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/AccountRecovery/AccountRecovery.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/Login/LoginPage.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/OTP/OtpScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/OTP/PhoneAuthentication.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/Signup/SignupForm.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/DrawerMenuHomeScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Menu/Menu.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/MyCredentials/MyCredentialScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NewOrder/NewOrderScreen.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/PickCurrentLocation/PickCurrentLocation.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Reward/Reward.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/SplashScreen/SplashScreen.dart';

import '../Screen/ChooseCategory/ChooseCategory.dart';

class AppRoutes {
  static String INITIAL = "/";
  static String CHOOSE_CATEGORY = "/homepage";
  static String MENU = "/menu";
  static String REWARD = "/reward";
  static String DRAWERMENHOMESCREEN = "/drawermenu_homescreen";

  static String AUTHENTICATIONPAGE = "/authentication";
  static String PHONENUMBERAUTH = "/phoneNumberAUth";
  static String OTPSCREEN = "/otpScreen";
  static String ACCOUNTRECOVERY = "/account_recovery";

  static String LOGIN = "/login";
  static String SIGNUP = "/signup";

  static String ORDERACCEPT = "/acceptOrder";
  static String MY_CREDENTIAL = "/mycredential";
  static String PICK_LOCATION = "/pickCurrentLocationScreen";

  static List<GetPage> AppRoutesList() {
    return [
      GetPage(name: INITIAL, page: () => SplashScreen()),
      GetPage(name: CHOOSE_CATEGORY, page: () => ChooseCategory()),
      GetPage(name: DRAWERMENHOMESCREEN, page: () => DrawerMenuHomeScreen()),
      GetPage(name: REWARD, page: () => Reward()),
      GetPage(name: LOGIN, page: () => LoginPage()),
      GetPage(name: ACCOUNTRECOVERY, page: () => AccountRecovery()),
      GetPage(name: PHONENUMBERAUTH, page: () => PhoneAuthentication()),
      GetPage(name: OTPSCREEN, page: () => OtpScreen()),
      GetPage(name: SIGNUP, page: () => SignupForm()),
    //  GetPage(name: ORDERACCEPT, page: () => NewOrderScreen()),
      GetPage(name: MY_CREDENTIAL, page: () => MyCredentialsScreen()),
      GetPage(name: PICK_LOCATION, page: () => PickCurrentLocationScreen()),
    ];
  }
}
