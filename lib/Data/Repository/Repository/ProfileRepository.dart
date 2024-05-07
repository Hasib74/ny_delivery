import 'package:runnerfooddelivery_frontend_deliveryman/Core/DataSource/Remote/ApiUrls.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/ProfileRemoteRepo.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/delivery_man_profile.dart';
import '../../_Token/TokenController.dart';

class ProfileRepository {
  ProfileRemoteRepo _profileRemoteRepo = new ProfileRemoteRepo();

  Future<DeliveryManProfile?> loadDeliveryManProfileInformation() async {
    DeliveryManProfile profileInfoDetails;
    Either<dynamic, Failure> response =
        await this.getDeliveryManDetailsInformation();

    response.fold((left) {
      print("Profile Response data: ${jsonDecode(left.body)}");
      profileInfoDetails = DeliveryManProfile.fromJson(jsonDecode(left.body));

      return profileInfoDetails;
    }, (right) {
      print('error');
      return null;
    });
  }

  Future<Either<dynamic, Failure>> getDeliveryManDetailsInformation() async {
    Either<dynamic, Failure> response;

    Either<dynamic, Failure> userResponse =
        await _profileRemoteRepo.getDeliveryManDetails();
    ;
    /* userResponse.fold((l) {


      print("Response ::: l ${l.body}");
      response = Left(l);
    }, (r) {

      print("Response ::: r ${r}");

      response = Right(r);
    });*/

    return userResponse;
  }

  Future<Either<dynamic, Failure>?> updateDeliveryManProfileDetails(
      Map<String, String> body,
      /*  File nidCardImageFile,*/
      File profilePhoto) async {
    Either<dynamic, Failure>? response;

    var request = new http.MultipartRequest("POST",
        Uri.parse("${ApiUrls.base_url}update"));

    request.fields.addAll(body);
    //request.files.add(await http.MultipartFile.fromPath('nid_card', nidCardImageFile.path));

    //add header

    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${TokenController.to.token.toString()}'
    };

    print("Header ::: ${_header}");

    request.headers.addAll(_header);

    print("Image path before upload ::: ${profilePhoto.path}");

    if (profilePhoto.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'delivery_men_image', profilePhoto.path));
    }

    var res = await request.send();

    print(
        "Response profile ::: ${res.statusCode} ${res.reasonPhrase} ${res.request}");

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("Uploaded!");
      response = Left(res);
    } else {
      print("Upload Failed!");
      response = Right(ServerFailure(msg: "Upload Failed!"));
    }

    //upload file with http request

    return response;
  }

  Future<Either<dynamic, Failure>?> updateDeliveryManCredentials(
      String currentPassword, String newPass, String retypePass) async {
    Either<dynamic, Failure>? response;

    var either = await _profileRemoteRepo.updateDeliveryManCredentials(
        currentPassword, newPass, retypePass);

    Either<dynamic, Failure> userResponse = either;
    userResponse.fold((l) {
      response = Left(l);
    }, (r) {
      response = Right(r);
    });

    return response;
  }
}

/*
* {"success":true,"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvd2luZ3N0aGluZ3NhbmRwaXp6YXMuZXZlbnRzYW5kaW1hZ2UuY29tXC9hcGlcL2RlbGl2ZXJ5X21hblwvbG9naW4iLCJpYXQiOjE2OTE5NjEyNzAsImV4cCI6Mzg1MTk2MTI3MCwibmJmIjoxNjkxOTYxMjcwLCJqdGkiOiJ1Z1hudUpJWVVYa0RFOXlqIiwic3ViIjoxMiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.R39uJZYV8ORjfHmVjR5LIgFzHZkN7bYotI2gMtYFjQ0"}
*
*
* */
