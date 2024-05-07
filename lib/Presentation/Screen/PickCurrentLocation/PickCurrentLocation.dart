import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/PickCurrentLocation/Controller/PickCurrentLocationController.dart';

import '../../utils/AppColors.dart';

/*PickCurrentLocationController _pickCurrentLocationController = Get.find();*/

class PickCurrentLocationScreen extends StatelessWidget {
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    PickCurrentLocationController.to.getCurrentLocation();

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Obx(() => Text("${PickCurrentLocationController.to.latlng.value}")),
            Expanded(
              child: Obx(() => Stack(
                    children: [
                      GoogleMap(

                          // all the other arguments
                          initialCameraPosition: CameraPosition(
                            target:
                                PickCurrentLocationController.to.latlng.value,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId("userPositionId"),
                              position:
                                  PickCurrentLocationController.to.latlng.value,
                              icon: BitmapDescriptor.defaultMarker,
                            )
                          },
                          myLocationButtonEnabled: true,
                          zoomGesturesEnabled: true,
                          zoomControlsEnabled: true,
                          myLocationEnabled: true,
                          onMapCreated: (GoogleMapController controller) {
                            PickCurrentLocationController
                                .to.pickLocationGoogleMapcontroller
                                .complete(controller);
                          },
                          onTap: (latLng) {
                            print('${latLng.latitude}, ${latLng.longitude}');

                            PickCurrentLocationController.to.latlng.value =
                                LatLng(latLng.latitude, latLng.longitude);
                            /*Get.back(result: LatLng(latLng.latitude, latLng.longitude));*/
                          }),
                      _next_button(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _next_button() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: InkWell(
        onTap: () =>
            Get.back(result: PickCurrentLocationController.to.latlng.value),
        child: Container(
          width: 60,
          height: 25,
          child: Center(
            child: Text(
              "Next",
              style: Get.textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(color: AppColors.orange),
        ),
      ),
    );
  }
}
