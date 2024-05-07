import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/AppColors.dart';

Widget DrawerButtonWidget(
    {double height = 40,
    IconData? icon,
    double iconSize = 15,
    double borderRadious = 5,
    required String title,
    VoidCallback? onTab}) {
  return InkWell(
    onTap: onTab,
    child: Container(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Container(
            height: height,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadious))),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.orange,
              ),
            ),
          ),
          Positioned(
            left: 50,
            // right: 0,
            child: Container(
              height: height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
