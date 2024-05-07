import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:http/src/response.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiClient.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/NewOrderRepository.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';

class NewOrderRemoteRepo implements NewOrderRepo {
  @override
  Future<Either<Response, Failure>?> getNewOrder(id) async {
    print("getNewOrder : ${id}");
    Either<Response, Failure>? _res;

    try {
      var _header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TokenController.to.token.toString()}'
      };
      var _response = await http.get(
          Uri.parse(
            "${ApiUrls.neworder_list + "/${id}"}",
          ),
          headers: _header);
      print(
          "getNewOrder Url Response ......... ${ApiUrls.neworder_list + "/${id}"}");
      print("getNewOrder header ......... ${_header}");
      print("getNewOrder response ......... ${_response.body}");
      if (_response.statusCode == 200) {
        _res = Left(_response);
      }
    } catch (err) {
      printInfo(info: "getNewOrder : err ${err.toString()}");
      _res = Right(ServerFailure());
    }

    return _res;
  }

  @override
  Future<Either<Response, Failure>?> acceptOrder(
      {delivery_man_id, order_id, orderStatus}) async {
    // TODO: implement acceptOrder

    Either<Response, Failure>? _res;

    // Either<http.Response , Failure> _response = await  http.post(Uri.parse(ApiUrls.order_accept+"/${id}") , headers: _header) ;
    try {
      var _body = {
        "delivery_man_id": delivery_man_id,
        "id": order_id,
        "order_status": orderStatus
      };
      var _response = await http.post(Uri.parse(ApiUrls.order_accept),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${TokenController.to.token.toString()}'
          },
          body: jsonEncode(_body));

      print("Url Response ......... ${ApiUrls.order_accept}");
      print("Body...................${_body}");
      print("header ......... ${{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${TokenController.to.token.toString() ?? "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW5ib25ha2kuYmFhZGhhbi5jb21cL2FwaVwvZGVsaXZlcnltYW5cL2xvZ2luIiwiaWF0IjoxNjMzMjg0OTkzLCJleHAiOjM3OTMyODQ5OTMsIm5iZiI6MTYzMzI4NDk5MywianRpIjoiOGJTNGtENzlOTWV1WFlyZyIsInN1YiI6MjcsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.OkWfiu5-u5bzvBY0GL2eJlMqfEokYNvMMFn43jJMfcw"}'
      }.toString()}");
      print("response ......... ${_response.body}");
      if (_response.statusCode == 200) {
        _res = Left(_response);
      }
    } catch (err) {
      printInfo(info: err.toString());

      _res = Right(ServerFailure());
    }

    return _res;
  }
}
