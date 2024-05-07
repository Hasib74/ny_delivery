
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/AccountRecovery/Controller/AccountRecoveryController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppBackgroundWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppTextFieldWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';




//
class AccountRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  'Account Recovery',
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

                 GetBuilder<AccountRecoveryController>(
                  builder: (_){
                    print("is loading "+_.isPhoneNoScreenProcessingInprogress.toString());
                    if(_.isPhoneNoScreenProcessingInprogress){
                      return Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: AppLoading(),
                        ),
                      );
                    }else {
                      return AppButtonWidget(
                        leadingCenter: true,
                        title: 'Continue',
                        onTab: () {
                            AccountRecoveryController.to.phoneNumberVerification();
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
        hint: 'Enter your phone number',
        textInputType: TextInputType.number,
        controller: AccountRecoveryController.to.phoneNumberText,
      ),
    );
  }

  Widget createCountryDropdownlist() {
    return GetBuilder<AccountRecoveryController>(
      builder: (_){
        return Container(
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.divider_color),
            ),
            child: Center(
              child: DropdownButton(
                value: AccountRecoveryController.to.selectedCountryCode.toString(),
                onChanged: (dynamic newValue) {
                  print(newValue);
                  _.selectedCountryCode = newValue;
                  _.updateSelectedMenuItem(newValue);
                },
                items: AccountRecoveryController.to.allCountries.map((countryCode){
                  return DropdownMenuItem(
                    child: new Text(countryCode.toString(),textAlign: TextAlign.center,),
                    value: countryCode.toString(),
                  );
                }).toList(),
              ),
            ),
          );
  },
  );
  }


}