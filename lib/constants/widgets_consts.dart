import 'package:diet_app/constants/color_consts.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  static var enabledBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(3)),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.loginFieldHeaderColor.withOpacity(0.5),
    ),
  );
  static const focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(3)),
    borderSide: BorderSide(color: AppColors.loginFieldValueColor),
  );
}
