import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:core';

import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/AuthenticationRemoteRepository.dart';

class AuthenticationRepository {

  AuthenticationRemoteRepository _authenticationRemoteRepository =
      new AuthenticationRemoteRepository();

/*
  Future<bool> sendPhoneVerificationOTPCode22(String phoneno) async {
    try {
      await _authenticationRemoteRepository.sentOTPRemote(phoneno);
    } catch (e) {}

    String token = "";
    Map<String, String> header = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    String serverUrl = ApiUrls.phone_no_verificaton;
    var queryParameters = {'phoneno': phoneno};
    print("otpp phone");
    var response1 = await http.get(
        Uri.parse("${ApiUrls.phone_no_verificaton}?phoneno=${phoneno}"),
        headers: header);
    print("rashed ${response1}");
    return true;
  }
 */

  Future<Either<dynamic, Failure>?> getAllCountries() async {
    Either<dynamic, Failure>? response;
    Either<dynamic, Failure> vendorResponse =
        await _authenticationRemoteRepository.getCountries();

    vendorResponse.fold((l) {
      return response = Left(l);
    }, (r) {
      return response = Right(r);
    });
    return response;
  }

  Future<Either<http.Response?, Failure>?> sendPhoneVerificationOTPCode(
      String? phoneNo, String OTPCode) async {
    Either<http.Response?, Failure>? response;
    Either<http.Response?, Failure> vendorResponse =
        await _authenticationRemoteRepository.sentOTPRemote(phoneNo, OTPCode);

    vendorResponse.fold((l) {
      return response = Left(l);
    }, (r) {
      return response = Right(r);
    });
    return response;
  }

  Future<Either<http.Response, Failure>?> checkPhoneVerficationOTPCode(
      String phoneNo, String OTPCode) async {
    //  String token = "";
    //  Map<String,String> header = {
    //    "Content-type": "application/json",
    //    "Accept": "application/json"
    //  };
    //  String serverUrl = ApiUrls.phone_no_verificaton;
    // // print("otpp phone ${Uri(queryParameters: queryParameters).query}");
    //  var response1 = await http.get(Uri.parse("${ApiUrls.phone_no_verificaton}?phoneno=${phoneNo}&otpcode=${OTPCode}"), headers: header);
    //  print("rashed ${response1}");
    //  return true;
/*
    Either<http.Response, Failure> response;
    Either<http.Response, Failure> vendorResponse =
        await _authenticationRemoteRepository.sentOTPRemote(phoneNo);

    vendorResponse.fold((l) {
      return response = Left(l);
    }, (r) {
      return response = Right(r);
    });
    return response;

    */
  }







  Future<Either<http.Response?, Failure>?> sendAccountRecoveryPassword(String? phoneNo) async {
    Either<http.Response?,Failure>? response;
    Either<http.Response?,Failure> responseResult = await _authenticationRemoteRepository.sendAccountRecoveryPassword(phoneNo);
    responseResult.fold((l){
      return response = Left(l);
    },(r) {
      return response = Right(r);
    });
    return response;
  }

}
