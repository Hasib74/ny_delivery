import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/_Token/TokenController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Data/Constant/AppConstantData.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class ApiClient {
  // static var demo_token = 
      // "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYW5ib25ha2kuYmFhZGhhbi5jb21cL2FwaVwvbG9naW4iLCJpYXQiOjE2MTcxNjg0MTYsImV4cCI6Mzc3NzE2ODQxNiwibmJmIjoxNjE3MTY4NDE2LCJqdGkiOiIxVklWeTFxR21kVjBMeHYzIiwic3ViIjoxOCwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.QwRDq4iittb5x4Iexo20VVyWO00SNowRcPouKjFYGvc";

  static Future<http.Response?> Request(
      {required String url,
      Method method = Method.GET,
      var body,
      bool enableHeader = false}) async {
    http.Response response;


    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token.toString()}'
    };

    try {
      if (method == Method.POST) {
        if (enableHeader) {

          print("The token is : ${TokenController.to.token}");

          response =
              await http.post(Uri.parse(url), body: body, headers: _header);
        } else {
          response = await http.post(Uri.parse(url), body: body);

          print(
              "RESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSPONSE :::  => ${response.body}");
        }
      } else if (method == Method.DELETE) {
        response = await http.delete(Uri.parse(url));
      } else if (method == Method.PATCH) {
        response = await http.patch(Uri.parse(url), body: body);
      } else {
        if (enableHeader) {
          response = await http.get(Uri.parse(url), headers: _header);
        } else {
          response = await http.get(Uri.parse(url));
        }
      }
      showData(
          url: url,
          body: body,
          method: method,
          response: response.body,
          header: enableHeader ? _header : "no header");

      return response;
    } catch (e) {
      print("Request Error :: $e");
      return null;
    }
  }

  static Future RequestWithFile(
      {required String url,
      bool magic_method_allow = false,
      Map<String, String>? body,
      List<String>? fileKey,
      required List<File?> files,
      Method method = Method.POST,
      Map? headerData,
      bool headerRequired = false}) async {
    print("BODYYYYYYYYYYYYYYYYYYYY  ::: ${body}");


    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token.toString()}'
    };

    var result;
    var uri = Uri.parse(url);
    late http.MultipartRequest request;
    if (method == Method.POST) {
      request = new http.MultipartRequest("POST", uri)..fields.addAll(body!);
    } else if (method == Method.PATCH) {
      request = new http.MultipartRequest("PATCH", uri)..fields.addAll(body!);
    } else if (method == Method.PUT) {
      request = new http.MultipartRequest("PUT", uri)..fields.addAll(body!);
    }

    if (files.isNotEmpty) {
      for (int i = 0; i < fileKey!.length; i++) {
        print("Header FIle  Key ${fileKey[i]}");
        print("Header FIle   ${files[i]}");

        var stream =
            new http.ByteStream(DelegatingStream.typed(files[i]!.openRead()));
        var length = await files[i]!.length();
        var multipartFile = new http.MultipartFile(fileKey[i], stream, length,
            filename: basename(files[i]!.path));
        request.files.add(multipartFile);
      }
    }

    if (headerRequired) {
      print("Header Added  ${_header}");
      request.headers.addAll(_header);
    }


    print("The Request files  : ${request.files}");
    print("The Request headers  : ${request.headers}");
    print("The Request url  : ${request.url}");
    print("The Request method  : ${request.method}");
    print("The Request body  : ${request.fields}");


    var response = await request.send();


    await response.stream.transform(utf8.decoder).listen((value) {

      description:
      print("The Response : ${value}");
      result = value;
      print(result);
    });
    showData(url: url, body: body, method: method, response: result.toString());
    return json.decode(result);
  }

  static void showData(
      {String? url, var body, String? response, Method? method, var header}) {
    if (!kReleaseMode) {
      //print("Header = $header");
      print("URL = $url");
      print("Body = $body");
      print("Method = $method");
      print("Header = ${header}");
      print("Response = $response");
    }
  }

  // static Map<String, String> header = {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  //   // 'Authorization': 'Bearer ${AppConstantData.token ?? demo_token}'
  //     'Authorization': 'Bearer ${AppConstantData.token}'
  //
  // };
}
