import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../Data/Model/order_details_model.dart';
import '../../Widgets/AppLoading.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppSpaces.dart';
import 'Controller/OrderDetailsController.dart';

class OrderDetailsDialog extends StatelessWidget {
  final int? orderId;

  const OrderDetailsDialog({Key? key, this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: Get.width * 0.9,
          height: Get.height * 0.8,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: OrderDetailsController.to.getOrderDetails(orderId),
                  builder: (BuildContext context,
                      AsyncSnapshot<OrderDetailsModel> snapshot) {
                    print("Orderdetails ::${snapshot.data.toString()}");
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Product Name",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 16),
                                  textAlign: TextAlign.center),
                              Text("Quantity",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 16),
                                  textAlign: TextAlign.center),
                              Text("Price",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 16),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: snapshot
                                    .data!.message!.orderDetails!.length,
                                itemBuilder: (context, int index) {
                                  var _data = snapshot
                                      .data!.message!.orderDetails![index];

                                  print(
                                      "Order details  product name ::${_data.productName} ");
                                  print(
                                      "Order details quantity ::${_data.quantity.toString()} ");
                                  print(
                                      "Order details amount ::${_data.amount.toString()} ");

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(_data.productName ?? "",
                                              textAlign: TextAlign.center),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            _data.quantity?.toString() ?? "",
                                            style: TextStyle(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: new Text(
                                              "\$ ${_data.amount?.toString()}",
                                              textAlign: TextAlign.center),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          AppSpaces.spaces_width_15,
                          Divider(),
                          AppSpaces.spaces_width_15,
                          Container(
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  "Paid Amount ",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                AppSpaces.spaces_width_15,
                                AppSpaces.spaces_width_15,
                                Text(
                                  "\$ ${snapshot.data!.message!.paidAmount
                                      .toString()}",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                AppSpaces.spaces_width_15,
                              ],
                            ),
                          ),
                          AppSpaces.spaces_width_15,
                          Divider(),
                          AppSpaces.spaces_width_15,
                          Container(
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  "Discount ",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                AppSpaces.spaces_width_15,
                                AppSpaces.spaces_width_15,
                                Text(
                                  snapshot.data!.message!.discount.toString()+" %",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                AppSpaces.spaces_width_15,
                              ],
                            ),
                          ),
                          AppSpaces.spaces_width_15,
                          Divider(),
                          AppSpaces.spaces_width_15,
                          Container(
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  "Total Amount ",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                AppSpaces.spaces_width_15,
                                AppSpaces.spaces_width_15,
                                Text(
                                 "\$ ${ snapshot.data!.message!.totalAmount
                                     .toString()}",
                                  style: Get.textTheme.headline6!
                                      .copyWith(fontSize: 14),
                                ),
                                AppSpaces.spaces_width_15,
                              ],
                            ),
                          ),
                          AppSpaces.spaces_height_15,
                          AppSpaces.spaces_height_15,
                          AppSpaces.spaces_height_15,
                        ],
                      );
                    } else {
                      return Center(
                        child: SizedBox(child: AppLoading()),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
