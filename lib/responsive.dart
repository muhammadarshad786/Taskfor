import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;

    if (screenWidth! > 550) {
      defaultSize = screenWidth! * 0.014;
    } else {
      defaultSize = screenWidth! * 0.020;
    }
  }
}

double getHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight ?? 812.0;
  return (inputHeight / 812.0) * screenHeight;
}

double getWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth ?? 375.0;
  return (inputWidth / 375.0) * screenWidth;
}

double getFont(double size) {
  double defaultsSize = SizeConfig.defaultSize! * size;
  return (defaultsSize / 10);
}
