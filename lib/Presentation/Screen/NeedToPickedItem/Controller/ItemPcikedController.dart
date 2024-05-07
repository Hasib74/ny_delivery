import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:runnerfooddelivery_frontend_deliveryman/Core/Error/failures.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Model/PickedItemModel.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/ItemPickedRemoteRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Remote/Repository/OrderRemoteRepo.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/ItemPickedRepository.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/Profile/Controller/ProfileController.dart';

import '../../../../Data/Firebase/DataSource/FirebaseKey.dart';

class ItemPickedController extends GetxController {
  static ItemPickedController to = Get.find();

  Rx<PickedItemModel> pickedItemModel = new PickedItemModel().obs;

  RxBool loading = false.obs;

  ItemPickedRepository _itemPickedRepository = ItemPickedRemoteRepository();

  OrderRemoteRepo _orderRemoteRepo = OrderRemoteRepo();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  getAllPickedItem() async {
    Either<http.Response, Failure> _response =
        await _itemPickedRepository.getAllOrderItemPicked();

    _response.fold((l) {
      print("getAllPickedItem  ${l.body}");

      loading(false);
      pickedItemModel.value = PickedItemModel.fromJson(jsonDecode(l.body));



    }, (r) {

      loading(false);
      print("ItemPickedController" + r.toString());
    });
  }

  pickOrderFromVendor(int? id) async {
    var _body = {"id": id};

    loading(true);
    var _response = await _orderRemoteRepo.orderPickedFromVendor(_body);

    _saveOrderToFirebase(id) ;



    getAllPickedItem();
  }


  _saveOrderToFirebase(int? order_id) {
    FirebaseDatabase.instance
        .ref(FirebaseKey.ACTIVE_ORDER)
        .child(order_id.toString())
        .update({
      FirebaseKey.ORDER_ID: order_id,
      FirebaseKey.DELIVERY_MAN_ID:  ProfileController.to.profileInfoDetails.value.response!.deliveryMenId,
      FirebaseKey.STATUS: "ready_to_delivery"
    });
  }
}
