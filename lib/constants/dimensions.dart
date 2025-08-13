

import 'package:flutter/material.dart';

class Dimensions{

  // paddings //
  static const double kPaddingExtraSmall = 08.0;
  static const double kPaddingSmall = 16.0;
  static const double kPaddingMedium = 20.0;
  static const double kPaddingLarge = 32.0;


  // border radius//
  static const double kBorderRadius = 16.0;
  static const double kBorderRadiusSmall = 12.0;
  static const double kBorderRadiusExtraSmall = 06.0;

  // Method to get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Method to get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}