import 'package:editable_image/editable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppButtonWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppTextFieldWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/ImageViewWidget.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';
import 'dart:io';

import '../../../Core/DataSource/Remote/ApiUrls.dart';

class DeliveryManProfileScreen extends StatelessWidget {
  // ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    ProfileController.to.getProfileInformation();
/*
    print("Delivery Man  ===> ${profileController.}");
*/
    return SingleChildScrollView(
      child: Container(
          width: Get.width,
          child: Obx(() {
            // printInfo(
            //     info:
            //         "Profile details name : ${ProfileController.to.profileInfoDetails.value.response.fullName}");

            if (ProfileController.to.profileInfoDetails.value == null) {
              return Container();
            } else
              return Stack(
                children: [
                  ProfileController.to.profileInfoDetails.value.response == null
                      ? Container()
                      : _body(context),
                  _loading(),
                ],
              );
          })),
    );
  }

  Column _body(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        AppSpaces.spaces_height_15,
        _viewProfile(),
        _editProfile(),
      ],
    );
  }

  Container _editProfile() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(top: 15, bottom: 10),
      margin: EdgeInsets.fromLTRB(37, 10, 37, 10),
      //color: Colors.orangeAccent[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Update Your Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              color: Colors.deepOrange,
            ),
          ),

          Obx(() => EditableImage(
                size: 100,
// Define the method that will run on the change process of the image.
                onChange: (file) => _directUpdateImage(file),

// Define the source of the image.
                image: ProfileController.to.profileImage.value.path != ""
                    ? Image.file(ProfileController.to.profileImage.value,
                        fit: BoxFit.cover)
                    : ProfileController
                                .to.profileInfoDetails.value.response?.image ==
                            null
                        ? Image.asset(
                            "assets/icon/user.png",
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "" +
                                ProfileController.to.profileInfoDetails.value
                                    .response!.image!,
                            fit: BoxFit.cover),

// Define the size of EditableImage.

// Define the Theme of image picker.
                imagePickerTheme: ThemeData(
                  // Define the default brightness and colors.
                  primaryColor: Colors.white,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.white70,
                  iconTheme: const IconThemeData(color: Colors.black87),

                  // Define the default font family.
                  fontFamily: 'Georgia',
                ),
              )),

          // informationUpdating(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  'Full Name',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: AppTextFieldWidget(
                    levelText: ProfileController.to.profileInfoDetails != null
                        ? ProfileController
                            .to.profileInfoDetails.value.response!.fullName
                        : "",
                    controller: ProfileController.to.fullnameText),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  'User Name',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: AppTextFieldWidget(
                    levelText: ProfileController
                            .to.profileInfoDetails.value.response?.userName ??
                        "",
                    controller: ProfileController.to.userNameText),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  'Your Email',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: AppTextFieldWidget(
                    levelText: ProfileController.to.profileInfoDetails != null
                        ? ProfileController
                            .to.profileInfoDetails.value.response!.email
                        : "",
                    enable: false,
                    controller: ProfileController.to.emailText),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  'Mobile No.',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: AppTextFieldWidget(
                    levelText: ProfileController.to.profileInfoDetails != null
                        ? ProfileController
                            .to.profileInfoDetails.value.response!.phone
                        : "",
                    enable: false,
                    controller: ProfileController.to.phoneText),
              ),
            ],
          ),
          // SizedBox(
          //   height: 10,
          // ),
          //
          // profileAddressRow(
          //     'Phone',
          //     '',
          //     ProfileController.to.profileInfoDetails != null
          //         ? ProfileController
          //             .to.profileInfoDetails.value.response!.phone
          //         : ''),
          SizedBox(
            height: 10,
          ),
          // profileNIDRow('NID', context),
          SizedBox(
            height: 10,
          ),
          AppButtonWidget(
              title: "Update",
              leadingCenter: true,
              onTab: () {
                ProfileController.to.updateProfile();
              })
        ],
      ),
    );
  }

  Container _viewProfile() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      margin: EdgeInsets.fromLTRB(40, 00, 40, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ProfilePicture(
            name: ProfileController
                    .to.profileInfoDetails.value.response?.fullName ??
                "Unknown",
            radius: 31,
            fontsize: 21,
            img:
                ProfileController.to.profileInfoDetails.value.response?.image !=
                        null
                    ? ApiUrls.download_base_url +
                        ProfileController
                            .to.profileInfoDetails.value.response!.image!
                    : null,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            ProfileController.to.profileInfoDetails.value != null
                ? ProfileController
                    .to.profileInfoDetails.value.response!.fullName!
                : "",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            ProfileController.to.profileInfoDetails != null
                ? ProfileController.to.profileInfoDetails.value.response!.email!
                : "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Text(
            ProfileController.to.profileInfoDetails != null
                ? ProfileController.to.profileInfoDetails.value.response!.phone!
                : "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }

  Widget profileNameRow(String title, String hintsText, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: AppTextFieldWidget(
              hint: 'Enter Your Full Name',
              levelText: value,
              controller: ProfileController.to.fullnameText),
        ),
      ],
    );
  }

  Widget profileEmailRow(String title, String hintsText, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: AppTextFieldWidget(
              hint: hintsText,
              levelText: value,
              enable: false,
              controller: ProfileController.to.emailText),
        ),
      ],
    );
  }

  Widget profilePhoneNumberRow(String title, String hintsText, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: AppTextFieldWidget(
              hint: hintsText,
              levelText: value,
              enable: false,
              controller: ProfileController.to.phoneText),
        ),
      ],
    );
  }

  Widget profileAddressRow(String title, String hintsText, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: AppTextFieldWidget(
                hint: hintsText,
                levelText: value,
                controller: ProfileController.to.addressText),
            onTap: () {
              print('click on text');
            },
          ),
        ),
      ],
    );
  }

  Widget profileNIDRow(String title, BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 2,right: 2),
      // color: Colors.amberAccent,
      width: Get.width,
      //   height: 200,
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Container(
          //   width: 100,
          //   height: 100,
          //   color: AppColors.orange,
          //   child: Obx(() => ImageViewWidget(
          //         imageUrl: ProfileController.to.profileInfoDetails.value !=
          //                 null
          //             ? ProfileController.to.profileInfoDetails.value.NIDPhoto
          //             : '',
          //         file: ProfileController.to.nidCardImageFile.value,
          //         borderEnable: true,
          //       )),
          // ),
          Container(
            width: 85,
            height: 50,
            // color: AppColors.orange,
            child: AppButtonWidget(
                title: 'Pick',
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                borderEnable: true,
                borderColor: Colors.black,
                borderRadius: 10,
                onTab: () {
                  ProfileController.to.isloadingCameraorGalleryFor = 2;
                  showProductImageSelectSource(context);
                }),
          ),
        ],
      ),
    );
  }

  Future openPhoneCameraOrGallery(bool isCamera, BuildContext context) async {
    File image;
    if (isCamera) {
      var _imagePicked = await (ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50));

      image = File(_imagePicked?.path ?? "");
    } else {
      var _imagePicked = await (ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50));
      image = File(_imagePicked?.path ?? "");
    }

    Get.back();
    if (image != null) {
      ProfileController.to.setNidCardImageFile(image);
      //
      print('photo ok');
    } else {
      print('No image selected.');
    }
  }

  Future<void> showProductImageSelectSource(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Pick Your NID ')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Icon(Icons.photo_album), // Text('Open Gallery'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  onSurface: Colors.grey,
                  shadowColor: Colors.red,
                  elevation: 5,
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
                onPressed: () {
                  openPhoneCameraOrGallery(false, context);
                },
              ),
            ),
            SizedBox(height: 7),
            Center(
              child: TextButton(
                child: Icon(Icons.camera_alt), // Text('Open Camera'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  onSurface: Colors.grey,
                  shadowColor: Colors.red,
                  elevation: 5,
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                ),
                onPressed: () {
                  openPhoneCameraOrGallery(true, context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  _directUpdateImage(File? file) async {
    if (file != null) {
      ProfileController.to.profileImage.value = file;
      ProfileController.to.updateProfile();
    } else {
      print('No image selected.');
    }
  }

  _loading() {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.center,
      child: Obx(() =>
          ProfileController.to.loading.value ? AppLoading() : Container()),
    ));
  }
}
