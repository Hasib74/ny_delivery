import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Routes/AppRoutes.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Authentication/OTP/Controller/OtpController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppBackgroundWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppTextFieldWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';


class OtpScreen extends StatelessWidget {


	@override
	Widget build(BuildContext context) {

		OtpController.to.startCountdownTimer();
		return AppBackgroundWidget(
		 child: SingleChildScrollView(
		   child: Column(
			 mainAxisAlignment: MainAxisAlignment.start,
			 crossAxisAlignment: CrossAxisAlignment.start,
			 children: [
				 AppSpaces.spaces_height_5,
				 Padding(
					 padding: const EdgeInsets.all(16.0),
					 child: Text(
						 'OTP Code',
						 style: Theme.of(context).textTheme.headline6,
					 ),
				 ),
				 AppTextFieldWidget(
					 hint: 'Enter OTP Code',
					 textInputType: TextInputType.number,
					 controller: OtpController.to.phoneOTPCodeText,
				 ),
				 AppSpaces.spaces_height_10,
		       GetBuilder<OtpController>(
           builder: (_){
             if(_.isOTPScreenProcessing){
               return Center(
                 child: Container(
                   width: 50,
                   height: 50,
                   child: AppLoading(),
                 ),
               );
             }
             else {
               return AppButtonWidget(
                 leadingCenter: true,
                 title: 'Continue',
                 onTab: () {
									 OtpController.to.phoneNumberOTPCodeVerification();
                 },
               );
             }
           },
         ),
				 SizedBox(height: 10,),
				 Container(
					 margin: EdgeInsets.all(10),
					 child: GetBuilder<OtpController>(
						 builder: (_){
						 	if(_.countDownstart > 0 ){
						 		return Text('Remaining Time  ${_.countDownstart}',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),);
							}
						 	else {
						 		return Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: <Widget>[
										Text('OTP Code Expired',style: TextStyle(
											fontSize: 15,
											fontWeight: FontWeight.bold,
										),),
										AppButtonWidget(title: "Resend",leadingCenter: true,backgroundColor: Colors.deepOrange,width: 100,onTab: (){
											OtpController.to.resendOTPCode();
										}) ,
									],
								);
							}
						 },

					 ),
				 ),

			 ],
		   ),
		 ),
		);
	}
}