import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppLoading.dart';

enum ImageType {
  RING,
  RECTANGLE,
}

Widget ImageViewWidget(
        {required String imageUrl,
        ImageType imageType = ImageType.RECTANGLE,
        BoxFit fit = BoxFit.cover,
        bool borderEnable = false,
        double? height,
        double? width,
        File? file,
        double imageSize = 80}) =>
    file == null
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              width: height ?? imageSize ?? double.infinity,
              height: width ?? imageSize ?? double.infinity,
              decoration: BoxDecoration(
                shape: imageType == ImageType.RECTANGLE
                    ? BoxShape.rectangle
                    : BoxShape.circle,
                border: borderEnable ? Border.all() : null,
                image: DecorationImage(
                    image: imageProvider, fit: fit ?? BoxFit.cover),
              ),
            ),
            placeholder: (context, url) =>
                SizedBox(width: 20, height: 20, child: AppLoading()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
        : Container(
            width: height ?? imageSize ?? double.infinity,
            height: width ?? imageSize ?? double.infinity,
            decoration: BoxDecoration(
                shape: imageType == ImageType.RECTANGLE
                    ? BoxShape.rectangle
                    : BoxShape.circle,
                border: borderEnable ? Border.all() : null,
                image: DecorationImage(
                    fit: fit ?? BoxFit.cover, image: FileImage(file))),
          );