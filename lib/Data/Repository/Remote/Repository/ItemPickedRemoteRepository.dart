import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/ItemPickedRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';

class ItemPickedRemoteRepository implements ItemPickedRepository {
  String _TAG = "ItemPickedRemoteRepository";

  @override
  Future<Either<http.Response, Failure>> getAllOrderItemPicked() async {
    // TODO: implement getAllOrderItemPicked

    Either<http.Response, Failure> _res;
    try {
      // Map<String, dynamic> _body = {"id": id, "device_token": deviceToken};
      var _header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TokenController.to.token}'
      };
      var _response =
          await http.get(Uri.parse(ApiUrls.pendingOrder), headers: _header);

      print("${_TAG} Response : ${_response.body}");
      print("${_TAG} header : ${_header}");
      print("${_TAG} url : ${ApiUrls.pendingOrder}");

      _res = Left(_response);
    } on Exception catch (e) {
      // TODO
      print("${_TAG} error : ${e.toString()}");

      _res = Right(ServerFailure());
    }

    return _res;
  }
}
