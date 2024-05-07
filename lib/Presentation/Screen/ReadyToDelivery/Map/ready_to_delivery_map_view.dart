import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapFunction.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/DataSource/FirebaseKey.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Firebase/Repository/map_repository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NeedToPickedItem/Controller/NeedToPickupMapController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/ReadyToDelivery/Controller/ReadyToDeliveryMapController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';

import '../../../../Core/Map/MapView/Controller/AppMapController.dart';

import 'dart:math' as math;

class NeedToDeliveryUpMapView extends StatelessWidget {
 // LatLng vendorLocation;

  LatLng? orderAddress;

  NeedToDeliveryUpMapView({Key? key, this.orderAddress,/* this.vendorLocation*/})
      : super(key: key);

  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController? googleMapController;

  var _lastMapPosition;

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.7914156, 90.3947096),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    Get.put(AppMapController());
    Get.put(ReadyToDeliveryController());

    AppMapController.to.getCurrentLocation().then((value) {
      _kGooglePlex = CameraPosition(
        target: LatLng(AppMapController.to.position.value.latitude,
            AppMapController.to.position.value.longitude),
        zoom: 14.4746,
      );
    });

    ReadyToDeliveryController.to
        .loadMarkers(orderPlace: orderAddress!,/* vendorLocation: vendorLocation*/);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: Obx(() => ReadyToDeliveryController.to.markers.value == null
                    ? Container()
                    : GoogleMap(
                        markers: ReadyToDeliveryController.to.markers,
                        initialCameraPosition: _kGooglePlex,
                        onMapCreated: _mapCreated,
                        onCameraMove: _onCameraMove,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      ))),
            Positioned(
                top: 20,
                left: 20,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_outlined),
                ))
          ],
        ),
      ),
    );
  }

  void _mapCreated(GoogleMapController controller) async {
    this.googleMapController = controller;

    _controller.complete(controller);

    ReadyToDeliveryController.to.googleMapController = controller;
    ReadyToDeliveryController.to.zoomCameraWithMultiMarkersPosition();
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

// _indicatorIcon() {
//   return Obx(() {
//
//     printInfo(info: "Driver current location :: ${MapRepository.to.currentLocation.value}") ;
//     return Transform.rotate(
//         angle: (MapFunction().getOffsetFromNorth(
//                 MapRepository.to.currentLocation.value.latitude,
//                 MapRepository.to.currentLocation.value.longitude,
//                 vendorLocation ?? 23.7914156,
//                 vendorLocation ?? 90.3947096) *
//             (math.pi / 180) *
//             -1),
//         child: Icon(Icons.vertical_align_top),
//       );
//   });
// }
}

class _indicatorIcon {}
