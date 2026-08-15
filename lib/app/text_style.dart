import 'package:evently_app/app/theme/app_colors_light.dart';
import 'package:flutter/material.dart';


class AppTextStyles {
  static TextStyle welcomeBackSt = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorsLight.hintColor,
  );
  static TextStyle hintStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorsLight.secText,
  );
  static TextStyle dateText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorsLight.mainColor,
  );

  static TextStyle mainTextSt = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.mainText,
  );
  static TextStyle btnText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle eventCardDate = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.mainColor,
  );
  static TextStyle eventCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.mainText,
  );
  static TextStyle eventCardTitledisable = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.disable,
  );
  static TextStyle eventCardTitleSelected = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle addEventText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.mainText,
  );
}