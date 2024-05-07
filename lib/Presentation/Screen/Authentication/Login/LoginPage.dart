import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/Login/Controller/LoginController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppPasswordTextFieldWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppTextFieldWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/generated/assets.dart';

import '../CreateDeliveryMan/add_delivery_man.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _loginController = Get.put(LoginController());
  var arg;

  ///pages Variables
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    arg = Get.arguments;
    return Scaffold(
      body: Obx(() => AbsorbPointer(
            absorbing: LoginController.to.isLoading.value,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  _body(context),
                  _loading(),
                ],
              ),
            ),
          )),
    );
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.spaces_height_15,
            AppSpaces.spaces_height_15,

            Center(
              child: Image(
                image: AssetImage(Assets.iconLoginPageLogo),
                width: Get.width * 0.6,
              ),
            ),

            AppButtonWidget(
                evulation: 10,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                title: "Delivery",
                backgroundColor: Colors.red,
                borderRadius: 10,
                leadingCenter: true),

            AppSpaces.spaces_height_15,
            AppSpaces.spaces_height_15,
            _login_text(),
            AppSpaces.spaces_width_10,
            AppSpaces.spaces_height_5,
            _text_fields(),
            AppSpaces.spaces_height_25,
            _logInButton(),
            AppSpaces.spaces_height_25,

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  new GestureDetector(
                    onTap: () {
                      Get.to(() => AddDeliveryManScreen());
                    },
                    child: new Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),

            /*  AppSpaces.spaces_height_15,
            AppSpaces.spaces_height_15,

            Center(
              child: Text(
                'Need a Help !',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),

            AppSpaces.spaces_height_15,
            AppSpaces.spaces_height_15,
            Row(
              children: [
                Image(
                  image: AssetImage(Assets.iconContractWithUs),
                  width: Get.width / 2,
                ),
                Image(
                  image: AssetImage(Assets.iconEmailUs),
                  width: Get.width / 2,
                ),
              ],
            ),

            Row(
              children: [
                Image(
                  image: AssetImage(Assets.iconCallUs),
                  width: Get.width / 2,
                ),
                Image(
                  image: AssetImage(Assets.iconTextUs),
                  width: Get.width / 2,
                ),
              ],
            ),

            AppSpaces.spaces_height_15,

            Center(
              child: Image.asset(
                Assets.iconSocialLogin,
                width: Get.width,
              ),
            )*/
            //_createAccount_RecoverAccount(context),
          ],
        ),
      ),
    );
  }

  _login_text() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
    );
  }

  Column _text_fields() {
    return Column(
      children: [
        AppTextFieldWidget(
          //language.Enter_your_email
          hint: "Email",
          levelText: 'Enter your email',
          prefixIcon: Icons.perm_identity,
          controller: _loginController.emailController,
        ),
        AppSpaces.spaces_height_10,
        AppPasswordTextFieldWidget(
            context: context,
            hint: "Password",
            // obscureText: true,
            levelText: 'Enter your password',
            prefixIcon: Icons.lock_outline,
            controller: _loginController.passwordController),
      ],
    );
  }

  Widget _logInButton() {
    return Center(
      child: AppButtonWidget(
        backgroundColor: Colors.red,
        width: 120,
        height: 40,
        leadingCenter: true,
        onTab: () async {
          if (await _loginController.Login()) {
            if (arg == AppRoutes.CHOOSE_CATEGORY) {
              Get.back(result: true);
            } else {
              Get.offAllNamed(AppRoutes.DRAWERMENHOMESCREEN);
              //  AppSnackBar.errorSnackbar(msg: "Invalid Email or Password");
            }
          } else {
            print("loging error");
          }
        },
        title: 'Login',
      ),
    );
  }

  Container _createAccount_RecoverAccount(BuildContext context) {
    return Container(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.PHONENUMBERAUTH);
            },
            child: new Text(
              'Create Account',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.ACCOUNTRECOVERY);
            },
            child: new Text(
              'Recover Account',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 12,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  _loading() {
    return Obx(() {
      return LoginController.to.isLoading.value
          ? Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Align(
                alignment: Alignment.center,
                child: AppLoading(),
              ),
            )
          : Container();
    });
  }
}
