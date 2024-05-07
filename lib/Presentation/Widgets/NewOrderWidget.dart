import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppColors.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/AppSpaces.dart';

import '../../main.dart';

Widget NewOrderWidget(
    {String? vendorAddress,
    String? customerAddress,
    VoidCallback? accept,
    VoidCallback? decline}) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0, right: 0, bottom: 6),
    child: Container(
      width: Get.width,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.gray),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 10,
              blurRadius: 10,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: Get.width / 2 - 5,
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  vendorAddress ??
                      'Item Pick from address,vendor name: mr x,uposhohor,sylhet',
                 
                ),
              ),
              Container(
                width: Get.width / 2 - 5,
                padding: EdgeInsets.only(right: 10, top: 5),
                child: Text(
                  customerAddress ?? 'Delivery to user name: jakaria,ambokhana',
                ),
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               InkWell(
                onTap: accept,
                
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Accept",
                        style: Get.textTheme.bodyText1!.copyWith(
                            color: AppColors.white,
                             fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              
              InkWell(
                onTap: decline,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "Decline",
                        style: Get.textTheme.bodyText1!.copyWith(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            
            ],
          ),
          AppSpaces.spaces_bottom_1,
        ],
        
      ),
      
    ),
  );
}
