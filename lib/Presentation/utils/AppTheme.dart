import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runnerfooddelivery_frontend_deliveryman/Presentation/utils/Dimension.dart';

import 'AppColors.dart';

AppTheme() {
  return ThemeData(
    primaryColor: AppColors.orange,
    hintColor: AppColors.orange,
    primaryColorDark: AppColors.black,
    primaryColorLight: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(color: AppColors.white),
    dividerColor: AppColors.divider_color,
    colorScheme: ColorScheme.light(
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      primaryVariant: AppColors.orange,
      secondary: AppColors.orange,
      onSecondary: AppColors.white,
      secondaryVariant: AppColors.orange,
      background: AppColors.white,
      onBackground: AppColors.black,
      surface: AppColors.white,
      onSurface: AppColors.black,
      error: AppColors.orange,
      onError: AppColors.white,
    ),
    dividerTheme: DividerThemeData(
        //thickness: 1,
        //indent: 16,
        // endIndent: 16,
        color: AppColors.divider_color),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
          color: AppColors.text_color,
          fontSize: AppDimension.h1,
          fontWeight: FontWeight.w800),
      headline2: GoogleFonts.ubuntu(
          color: AppColors.text_color,
          fontSize: AppDimension.h2,
          fontWeight: FontWeight.bold),
/*      headline3: TextStyle(
          fontFamily: "Poppins",
          color: AppColors.color_text.withOpacity(0.8),
          //  fontSize: AppDimension.text_size_extra1_large,
          fontWeight: FontWeight.w400),*/
      bodyText1: GoogleFonts.roboto(
          /* letterSpacing: 1,
          wordSpacing: 0.9,*/
          color: AppColors.text_color,
          fontSize: AppDimension.b1,
          fontWeight: FontWeight.bold),
      bodyText2: GoogleFonts.roboto(
          color: AppColors.text_color,
          fontSize: AppDimension.b2,
          fontWeight: FontWeight.normal),
      /*bodyText2: TextStyle(
         // fontFamily: "Poppins",
          fontFamily: AppConstant.font_acuminVariableConcept,
          color: AppColors.color_text,
          fontSize: AppDimension.text_size_medium,
          fontWeight: FontWeight.bold),*/
    ),

    /*  pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: Page,
      TargetPlatform.android: RouteTransition()
    }),*/
  );
}
