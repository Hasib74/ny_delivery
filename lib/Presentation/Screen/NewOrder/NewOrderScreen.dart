// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Data/Repository/Repository/OrderRepository.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NewOrder/Controller/NewOrderController.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Screen/NewOrder/Controller/OrderAcceptDeclineController.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/AppButtonWidget.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/Widgets/NewOrderWidget.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppAseets.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
// import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';
//
// import '../../../Data/Model/new_order.dart';
//
// class NewOrderScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     NewOrderController.to.getNewOrders();
//     // OrderAcceptOrDelineController orderAcceptDelineController = Get.put(OrderAcceptOrDelineController());
//     OrderAcceptOrDelineController orderAcceptDelineController =
//         new OrderAcceptOrDelineController();
//
//     return Obx(
//       () => Container(
//         width: Get.width,
//         height: Get.height,
//         child: _screen_view(orderAcceptDelineController),
//       ),
//     );
//   }
//
//   Widget _screen_view(
//       OrderAcceptOrDelineController orderAcceptDelineController) {
//     Widget child;
//
//     if (NewOrderController.to.newOrder.value == NewOrder()) {
//       child = Center(
//         child: Text("Loading..."),
//       );
//     } else if (NewOrderController.to.newOrder.value.response!.isEmpty) {
//       child = Center(
//         child: Text("Data not found."),
//       );
//     } else {
//       child = ListView.builder(
//         itemCount: NewOrderController.to.newOrder.value.response!.length,
//         itemBuilder: (context, int index) {
//           var order = NewOrderController.to.newOrder.value.response![index];
//
//           return NewOrderWidget(
//               vendorAddress:
//                   'Pick from : \nName: ${order.customer?.address}\nShop Name: ${order.}\nAddress: ${order.vendorAddress}\nPhone: ${order.vendorPhone}',
//               customerAddress:
//                   'Delivery to : \nName: ${order.customerName}\nAddress: ${order.customerAddress}\nPhone: ${order.customerPhone}',
//               accept: () {
//                 print(
//                     "cccccccccccccccccccc ${OrderAcceptOrDelineController.to.newOrder.value.message![index]}");
//                 orderAcceptDelineController.selectedOptionAccept =
//                     OrderAcceptOrDelineController
//                         .to.newOrder.value.message![index];
//                 orderAcceptDelineController.orderAccept();
//
//                 print(
//                     "=========================================Accept............${orderAcceptDelineController.selectedOptionAccept!.id}");
//               },
//               decline: () {
//                 orderAcceptDelineController.selectedOptionDecline =
//                     OrderAcceptOrDelineController
//                         .to.newOrder.value.message![index];
//                 orderAcceptDelineController.orderDecline();
//                 print("decline api is call");
//               });
//         },
//       );
//     }
//
//     return child;
//   }
//
//   Widget createBanner() {
//     return Container(
//       width: 100,
//       height: 100,
//       margin: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//           border: Border.all(color: AppColors.black),
//           shape: BoxShape.circle,
//           image: DecorationImage(
//             image: AssetImage(AppAseets.icon),
//           )),
//     );
//   }
// }
//
// /*
//
//
// */
