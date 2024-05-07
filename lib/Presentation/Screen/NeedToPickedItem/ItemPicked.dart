import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NeedToPickedItem/Controller/ItemPcikedController.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NeedToPickedItem/Map/need_to_pick_map_view.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppLoading.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/OrderItemPickedWidget.dart';

import '../../utils/AppColors.dart';
import '../OrderDetails/OrderDetails.dart';

class ItemPickedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemPickedController());

    ItemPickedController.to.getAllPickedItem();
    return Obx(() {
      if (ItemPickedController.to.pickedItemModel.value.message == null ||
          ItemPickedController.to.loading.value) {
        return SizedBox(height: 20, width: 20, child: AppLoading());
      } else {
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              ItemPickedController.to.getAllPickedItem();
            },
            child: new ListView.builder(
                itemCount: ItemPickedController
                    .to.pickedItemModel.value.message!.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: _show_bottom_sheet_bar(),
                    child: OrderItemPickedWidget(
                      onAccept: () {
                        ItemPickedController.to.pickOrderFromVendor(
                            ItemPickedController
                                .to.pickedItemModel.value.message![index].id);
                      },
                      customer_name: ItemPickedController.to.pickedItemModel
                          .value.message![index].customer!.fullName,
                      customer_address: ItemPickedController
                          .to.pickedItemModel.value.message![index].orderAddress,
                      customer_number: ItemPickedController.to.pickedItemModel
                          .value.message![index].customer!.phone,
                      view: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            Spacer(),
                            Spacer(),
                            PhysicalModel(
                              elevation: 0.5,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: AppColors.gray,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              NeedToPickUpMapView(
                                                orderAddress: LatLng(
                                                    double.parse(
                                                        ItemPickedController
                                                            .to
                                                            .pickedItemModel
                                                            .value
                                                            .message![index]
                                                            .orderAddressLatValue
                                                            .toString()),
                                                    double.parse(
                                                        ItemPickedController
                                                            .to
                                                            .pickedItemModel
                                                            .value
                                                            .message![index]
                                                            .orderAddressLongValue
                                                            .toString())),
                                                vendorLocation: LatLng(
                                                  double.parse(
                                                      ItemPickedController
                                                          .to
                                                          .pickedItemModel
                                                          .value
                                                          .message![index]
                                                          .vendor!
                                                          .latValue
                                                          .toString()),
                                                  double.parse(
                                                      ItemPickedController
                                                          .to
                                                          .pickedItemModel
                                                          .value
                                                          .message![index]
                                                          .vendor!
                                                          .longValue
                                                          .toString()),
                                                ),
                                              )));
                                },
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                      child: Text(
                                    "View Map >",
                                    style: Get.textTheme.headline6!
                                        .copyWith(fontSize: 14)
                                        .copyWith(color: AppColors.white),
                                  )),
                                ),
                              ),
                            ),
                            Spacer(),
                            PhysicalModel(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              elevation: 0.5,
                              color: AppColors.gray,
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => OrderDetailsDialog(
                                          orderId: ItemPickedController
                                              .to
                                              .pickedItemModel
                                              .value
                                              .message![index]
                                              .id));
                                },
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                      child: Text(
                                    "Order Details >",
                                    style: Get.textTheme.headline6!
                                        .copyWith(fontSize: 14)
                                        .copyWith(color: AppColors.white),
                                  )),
                                ),
                              ),
                            ),
                            Spacer(),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      }
    });
  }

  _show_bottom_sheet_bar() {}
}
