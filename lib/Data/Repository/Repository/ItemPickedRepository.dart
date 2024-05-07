import 'package:dartz/dartz.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:http/http.dart' as http;
abstract class ItemPickedRepository{
Future<Either<http.Response , Failure>>  getAllOrderItemPicked() ;


}