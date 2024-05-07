import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';

class NewOrderNotificationWidget extends StatelessWidget {
  // const ({Key? key}) : super(key: key);

  final vendorName;

  final totalItem;

  final price;

  final delevery_fee;

  final delivery_location;

  final customer_name;

  final customer_number;

  final vendor_location;

  final distance;

  final peority;

  final paymentType;

  final List? order_description;

  final VoidCallback? onAccept;

  final Widget? view;

  bool acceptButtonAvailable;

  bool deliveryButtonAvailable;

  final orderCode;

  NewOrderNotificationWidget({
    this.vendorName ,
    this.delevery_fee,
    this.delivery_location ,
    this.distance ,
    this.paymentType = 0,
    this.peority = 0,
    this.price = "12 tk",
    this.totalItem = "120 pis",
    this.view,
    this.order_description ,
    this.vendor_location = "Mirpur Kazipara bus stand",
    this.customer_name = "Hasib Akon",
    this.customer_number = "",
    this.onAccept,
    this.acceptButtonAvailable = true,
    this.deliveryButtonAvailable = true,
    this.orderCode
  });

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 0.1,
                blurRadius: 0.1,
              )
            ]),
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: _deliveryTo(),
                          )
                        ],
                      ),
                      if (view != null) view!,
                    ],
                  ),
                ),
                if (acceptButtonAvailable) _accept_button()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _accept_button() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.gray,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: onAccept,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Deliver Now",
                  style: Get.textTheme.bodyText2!.copyWith(color: Colors.green),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  _pickupFrom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pick Up from",
          style: Get.textTheme.bodyText2,
        ),
        AppSpaces.spaces_height_5,
        SizedBox(
          width: 100,
          height: 1,
          child: Container(
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
        AppSpaces.spaces_height_5,
        Text("${vendorName}",
            style: Get.textTheme.bodyText2!
                .copyWith(color: Colors.black.withOpacity(0.8))),
        AppSpaces.spaces_height_5,
        Text("${vendor_location}",
            style: Get.textTheme.bodyText2!
                .copyWith(color: Colors.black.withOpacity(0.6))),
        AppSpaces.spaces_height_5,
        AppSpaces.spaces_height_5,
      ],
    );
  }

  _deliveryTo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order code : ${orderCode}",
            style: Get.textTheme.bodyText2!.copyWith(color: Colors.black)),
        SizedBox(
          width: 100,
          height: 1,
          child: Container(
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
        AppSpaces.spaces_height_5,
        Text("${customer_name}",
            style: Get.textTheme.bodyText2!
                .copyWith(color: Colors.black.withOpacity(0.6))),
        AppSpaces.spaces_height_5,
        Text("${delivery_location}",
            style: Get.textTheme.bodyText2!
                .copyWith(color: Colors.black.withOpacity(0.6))),
        AppSpaces.spaces_height_5,
        Text("${customer_number}",
            style: Get.textTheme.bodyText2!
                .copyWith(color: Colors.black.withOpacity(0.6))),
        AppSpaces.spaces_height_5,
        AppSpaces.spaces_height_5,
      ],
    );
  }

/* _price_info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total Item : ${totalItem}",
            style: Get.textTheme.bodyText2
                .copyWith(color: Colors.black.withOpacity(1))),
        AppSpaces.spaces_height_5,
        Text("Total fee : ${delevery_fee}",
            style: Get.textTheme.bodyText2
                .copyWith(color: Colors.black.withOpacity(1))),
        AppSpaces.spaces_height_5,
      ],
    );
  }*/
}
