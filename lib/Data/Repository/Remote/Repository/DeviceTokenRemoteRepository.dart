import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/DeviceTokenRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';


class DeviceTokenRemoteRepository extends DeviceTokenRepository {

  String _TAG = "_DeviceTokenRemoteRepository"  ;

  @override
  saveDeviceToken(String deviceToken, String id) async {
    // TODO: implement saveDeviceToken
    //  throw UnimplementedError()
    try {
      Map<String, dynamic> _body = {"id": id, "device_token": deviceToken};
      var _header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TokenController.to.token}'
      };
      var _response = await http.post(Uri.parse(ApiUrls.updateDeviceToken),
          body: jsonEncode(_body), headers: _header);

      print("${_TAG} Device info Response : ${_response.body}") ;
      print("${_TAG} header : ${_header}") ;
      print("${_TAG} url : ${ApiUrls.updateDeviceToken}") ;
    } on Exception catch (e) {
      // TODO
      print("${_TAG} error : ${e.toString()}") ;

    }

  }
}
