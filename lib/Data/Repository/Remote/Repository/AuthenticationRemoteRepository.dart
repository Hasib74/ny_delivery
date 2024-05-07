

import 'package:dartz/dartz.dart';

import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiClient.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:http/http.dart' as http;

import 'package:runnerfooddelivery_frontend_deliveryman/Core/Network/network_info.dart';

class AuthenticationRemoteRepository {


  Future<Either<http.Response?, Failure>> sentOTPRemote(String? phoneNo,String OTPCode) async {
    try{
      if(await NetworkInfoController.to.isConnected) {
        print("SUB BODY OTP Send ${phoneNo} code ${OTPCode}");
        dynamic response = await ApiClient.Request(
          url: "${ApiUrls.phone_no_verificaton}?phoneno=${phoneNo}&otpcode=${OTPCode}", //ApiUrls.phone_no_verificaton,//
          enableHeader: false,
          body: {'phoneno':phoneNo,'otpcode':OTPCode},
          method: Method.GET
          );
          return Left(response);
      }else {
        print("network error is occured");
        return Right(NoConnectionFailure());
      }
    }catch(err) {
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }



  Future<Either<http.Response?, Failure>> checkPhoneVerficationOTPCode(String phoneNo,String OTPCode) async {
    try{
      if(await NetworkInfoController.to.isConnected) {
        print("SUB BODY ${phoneNo}");
        dynamic response = await ApiClient.Request(
            url: "${ApiUrls.phone_verfication_OTP_checking}?phoneno=${phoneNo}&otpcode=${OTPCode}",
            enableHeader: false,
            body: {'phoneno':phoneNo,'otpcode':OTPCode},
            method: Method.POST
        );

        return Left(response);
      }else {
        print("network error is occured");
        return Right(NoConnectionFailure());
      }
    }catch(err) {
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }


  Future<Either<dynamic,Failure>> getCountries() async{

    try{
      if(await NetworkInfoController.to.isConnected) {
        print("SUB BODY country ");
        dynamic response = await ApiClient.Request(
            url: "${ApiUrls.country_list}",
            enableHeader: false,
            body: null,
            method: Method.GET
        );

        return Left(response);
      }else {
        print("network error is occured");
        return Right(NoConnectionFailure());
      }
    }catch(err) {
      print("Error : ${err}");
      return Right(ServerFailure());
    }
  }

  Future<Either<http.Response?, Failure>> sendAccountRecoveryPassword(String? phoneNo) async
  {
    try {
      if(await NetworkInfoController.to.isConnected) {
        print("Sub body Account Recovery ${phoneNo}");
        dynamic response = await ApiClient.Request(
          url: "${ApiUrls.account_recovery}",
          enableHeader:false,
          body:{
            'phone' : phoneNo
          },
          method:Method.POST
        );
        return Left(response);
      }else {
        print("Network error.........");
        return Right(NoConnectionFailure());
      }
    }catch(err) {
      print("Error.......................... : ${err}");
      return Right(ServerFailure());
    }
  }



}