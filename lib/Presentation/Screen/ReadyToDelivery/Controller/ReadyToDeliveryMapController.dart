import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapFunction.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Map/MapView/Controller/AppMapController.dart';

import '../../../../Data/Firebase/DataSource/FirebaseKey.dart';
import '../../../utils/AppAseets.dart';
import '../../Profile/Controller/ProfileController.dart';

class ReadyToDeliveryController extends GetxController {



  Rx<LatLng> orderPlace = new LatLng(0, 0).obs;

//  Rx<LatLng> vendorLocation = new LatLng(0, 0).obs;

  Rx<LatLng> myLocation = new LatLng(0, 0).obs;

  late GoogleMapController googleMapController;

  static ReadyToDeliveryController to = Get.find();

  RxSet<Marker> markers = <Marker>{}.obs;

  Future<void> loadMarkers(
      {required LatLng orderPlace, /*LatLng vendorLocation,*/ LatLng? myLocation}) async {
    await _setOrderPlaceMarker(orderPlace);
  //  await _setVendorMarker(vendorLocation);
    await _setMyLocationMarker();
  }

  zoomCameraWithMultiMarkersPosition() async {
    var bounds = MapFunction.getBounds(markers.toList());

    LatLng centerBounds = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2);

    googleMapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: centerBounds, zoom: 12)));
  }

  Future<void> _setMyLocationMarker() async {
    if (markers
        .where((element) => element.markerId == MarkerId("delivery_man"))
        .isNotEmpty) {
      markers.removeWhere(
          (element) => element.markerId == MarkerId("delivery_man"));

      markers.refresh();
    }

    markers.add(Marker(
      markerId: MarkerId("delivery_man"),
      icon: BitmapDescriptor.fromBytes(await MapFunction.getBytesFromAsset(
          AppAseets.my_location_marker, 90)),
      position: LatLng(AppMapController.to.currentLocation.value.latitude,
          AppMapController.to.currentLocation.value.longitude),
    ));

    FlutterCompass.events!.asBroadcastStream().listen((event) async {
      Future.delayed(Duration(seconds: 10)).then((value) async {
        if (markers
            .where((element) => element.markerId == MarkerId("delivery_man"))
            .isNotEmpty) {
          markers.removeWhere(
              (element) => element.markerId == MarkerId("delivery_man"));

          markers.refresh();
        }

        markers.add(Marker(
            markerId: MarkerId("delivery_man"),
            icon: BitmapDescriptor.fromBytes(
                await MapFunction.getBytesFromAsset(
                    AppAseets.my_location_marker, 90)),
            position: LatLng(AppMapController.to.currentLocation.value.latitude,
                AppMapController.to.currentLocation.value.longitude),
            rotation: event.heading!));
      });
    });

    ReadyToDeliveryController.to.markers.refresh();
  }

  Future<void> _setVendorMarker(LatLng vendorLocation) async {
    BitmapDescriptor _vendorLocationMarker =
        await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(60, 60)),
      AppAseets.vendor_location_marker,
    );

    ReadyToDeliveryController.to.markers.add(new Marker(
        icon: BitmapDescriptor.fromBytes(await MapFunction.getBytesFromAsset(
            AppAseets.vendor_location_marker, 70)),
        markerId: MarkerId("vendor"),
        position: vendorLocation ?? LatLng(23.7914156, 90.3947096)));

    ReadyToDeliveryController.to.markers.refresh();
  }

  Future<void> _setOrderPlaceMarker(LatLng orderPlace) async {
    ReadyToDeliveryController.to.markers
        .removeWhere((element) => element.markerId == MarkerId("order_place"));

    ReadyToDeliveryController.to.markers.refresh();

    BitmapDescriptor _orderPlaceMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(60, 60)),
      AppAseets.order_place_marker,
    );

    ReadyToDeliveryController.to.markers.add(new Marker(
        markerId: MarkerId("order_place"),
        infoWindow: InfoWindow(title: "Order Place"),
        position: orderPlace,
        icon: BitmapDescriptor.fromBytes(await MapFunction.getBytesFromAsset(
            AppAseets.order_place_marker, 70))));

    ReadyToDeliveryController.to.markers
        .removeWhere((element) => element.markerId == MarkerId("vendor"));

    ReadyToDeliveryController.to.markers.refresh();
  }




}
