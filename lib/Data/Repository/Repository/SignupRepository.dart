import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/SignupRemoteRepo.dart';
import 'dart:io';

class SignupRepository {

  SignupRemoteRepo _signupRemoteRepo = new SignupRemoteRepo();

  Future<Either<dynamic, Failure>?> deliveryManSignUp(body,File? nidCardImageFile,File? profilePhoto) async {
    Either<dynamic, Failure>? response;
    var either = await _signupRemoteRepo.signUp(body,[nidCardImageFile,nidCardImageFile],['delivery_men_image','delivery_men_ID_card']);

    Either<dynamic,Failure> userResponse = either;
    print("useeeeeeeeeeeeeeeeeeeeeee ${userResponse}");
    userResponse.fold((l) {
      response = Left(l);
     print("useeeeeeeeeeeeeeeeeeeeeee  left ${response}");

    }, (r) {
      response = Right(r);
           print("useeeeeeeeeeeeeeeeeeeeeee  right ${response}");

    });
    return response;
  }

}