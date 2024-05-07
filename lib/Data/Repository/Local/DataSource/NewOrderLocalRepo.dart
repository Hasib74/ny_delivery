import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/NewOrderRepository.dart';

class NewOrderLocalRepo implements NewOrderRepo {
  @override
  Future<Either<Response, Failure>> getNewOrder(id) {
    // TODO: implement getNewOrder
    throw UnimplementedError();
  }

  @override
  Future<Either<Response, Failure>> acceptOrder({delivery_man_id, order_id , orderStatus}) {
    // TODO: implement acceptOrder
    throw UnimplementedError();
  }


}
