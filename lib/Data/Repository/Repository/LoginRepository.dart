
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/LoginRemoteRepo.dart';
import 'package:dartz/dartz.dart';

class LoginRepository {

  LoginRemoteRepo _loginRemoteRepo = new LoginRemoteRepo();

  Future<Either<dynamic,Failure>?> deliveryLogin(body) async {
    Either<dynamic,Failure>? response;
    var either = await _loginRemoteRepo.login(body);

    Either<dynamic,Failure> userResponse = either;
    userResponse.fold((l) {
      response = Left(l);
    }, (r) {
      response = Right(r);
    });
    return response;
  }


}