import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';

abstract class NewOrderRepo {
  Future<Either<http.Response, Failure>?> getNewOrder(id);

  Future<Either<http.Response, Failure>?> acceptOrder(
      {required delivery_man_id, required order_id, required orderStatus});
}
