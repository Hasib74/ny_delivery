import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';

class OrderItemPickedWidget extends StatelessWidget {
  // const ({Key? key}) : super(key: key);

  final customer_name;

  final customer_address;

  final customer_number;

  final List order_items;

  final total_price;

  VoidCallback? onAccept;

  Widget? view;

  OrderItemPickedWidget(
      {this.customer_name = "Hasib Akon",
      this.customer_address = "12/A Kazipara, Mirpur, Dhaka",
      this.customer_number = "+880172712374",
      this.order_items = const ["1 pis berger", "3 pis poteto", "7 pis cheken"],
      this.total_price = 120,
      this.onAccept,
      this.view});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: Get.width,
        height: 200,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 0.5,
            blurRadius: 0.5,
          )
        ]),
        child: Column(
          children: [
            Expanded(child: _body()),
            _accept_button(),
          ],
        ),
      ),
    );
  }

  _body() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order From",
                          style: Get.textTheme.bodyText1,
                        ),
                        AppSpaces.spaces_height_5,
                        Container(
                          width: 75,
                          height: 1,
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        AppSpaces.spaces_height_5,
                        Text(customer_name ?? ""),
                        AppSpaces.spaces_height_5,
                        Text(customer_number ?? ""),
                        AppSpaces.spaces_height_5,
                        Text(customer_address ?? ""),
                      ],
                    ),
                  ),
                ),
                if (view != null) view!
              ],
            ),
          ),
        ],
      ),
    );
  }

  _accept_button() {
    return InkWell(
      onTap: onAccept,
      child: SizedBox(
        height: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.gray,
            ),
            Spacer(),
            InkWell(
                child: Text(
              "Picked",
              style: Get.textTheme.bodyText2!.copyWith(
                  color: AppColors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
