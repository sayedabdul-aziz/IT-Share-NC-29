import 'package:flutter/material.dart';
import 'package:taskati_app_1_1/core/utils/app_colors.dart';

showErrorText(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColors.redColor, content: Text(text)));
}
