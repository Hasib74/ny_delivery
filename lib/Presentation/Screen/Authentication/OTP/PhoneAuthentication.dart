import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Functions/AppSnackBar.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Model/CountryModel.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/AuthenticationRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/OTP/Controller/OtpController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppBackgroundWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppTextFieldWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';

class PhoneAuthentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    //OtpController.to.phoneNumberText.text = "8801731540704";

    // OtpController.to.loadCountries();

    return AppBackgroundWidget(
      child: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpaces.spaces_height_5,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select Country Code',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    createCountryDropdownlist(),
                    createPhoneNumberTextField(),
                  ],
                ),
              ),
              AppSpaces.spaces_height_10,
              GetBuilder<OtpController>(
                builder: (_) {
                  print("is loading " +
                      _.isPhoneNoScreenProcessingInprogress.toString());
                  if (_.isPhoneNoScreenProcessingInprogress) {
                    return Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        child: AppLoading(),
                      ),
                    );
                  } else {
                    return AppButtonWidget(
                      leadingCenter: true,
                      title: 'Continue',
                      onTab: () {
                        if (OtpController.to.phoneNumberText.text.length ==
                            10) {
                          OtpController.to.phoneNumberVerification();
                        } else {
                          AppSnackBar.errorSnackbar(
                              msg: "Phone number must be 10 digit.");
                        }

                        // Get.toNamed(AppRoutes.OTPSCREEN);
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget createPhoneNumberTextField() {
    return Expanded(
      child: AppTextFieldWidget(
        maxLines: 1,
        maxLength: 10,
        hint: 'Enter your phone number',
        textInputType: TextInputType.number,
        controller: OtpController.to.phoneNumberText,
      ),
    );
  }

  Widget createCountryDropdownlist() {
    return GetBuilder<OtpController>(
      builder: (_) {
        return Container(
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.divider_color),
          ),
          child: Center(
            child: DropdownButton(
              value: OtpController.to.selectedCountryCode.toString(),
              onChanged: (dynamic newValue) {
                print(newValue);
                _.selectedCountryCode = newValue;
                _.updateSelectedMenuItem(newValue);
              },
              items: OtpController.to.allCountries.map((countryCode) {
                return DropdownMenuItem(
                  child: new Text(
                    countryCode.toString(),
                    textAlign: TextAlign.center,
                  ),
                  value: countryCode.toString(),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

// Widget createCountryDropdownlist1(){
//   return Obx(()=>Container (
//     width: 100,
//      decoration: BoxDecoration(
//        border: Border.all(width: 1,color: AppColors.grayColor),
//      ),
//     child: Center(
//       child: DropdownButton(
//         value: OtpController.to.selectedCountryCode.value,
//         onChanged: (newValue) {
//           // setState(() {
//           OtpController.to.selectedCountryCode.value = newValue;
//           // });
//         },
//         items: countryCodes.map((location) {
//           return DropdownMenuItem(
//             child: new Text(location,textAlign: TextAlign.center,),
//             value: location,
//           );
//         }).toList(),
//       ),
//     ),
//   ));
//
// }
//

}
