
import 'package:dartz/dartz.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/OrderRemoteRepo.dart';

class OrderRepository {
  OrderRemoteRepo orderRemoteRepo = new OrderRemoteRepo();

  Future<Either<dynamic, Failure>?> newOrder() async {
    Either<dynamic, Failure>? response;
    var either = await orderRemoteRepo.newOrder();

    Either<dynamic, Failure> userResponse = either;
    userResponse.fold((l) {
      response = Left(l);
    }, (r) {
      response = Right(r);
    });
    return response;
  }

  Future<Either<dynamic,Failure>?> pendingOrder() async{
    Either<dynamic,Failure>? response;
    var either = await orderRemoteRepo.pendingOrder();

    Either<dynamic,Failure> userResponse = either;
    userResponse.fold((l) {
      response = Left(l);
    }, (r) {
      response = Right(r);
    });
    return response;
  }


  Future<Either<dynamic, Failure>> orderDetailsProductList(int? orderId) async {
    Either<dynamic, Failure> response =
    await orderRemoteRepo.getOrderDetailsProductList(orderId);

    //  Either<dynamic, Failure> userResponse = either;
    response.fold((l) {
      response = Left(l);
    }, (r) {
      response = Right(r);
    });
    return response;
  }
}
