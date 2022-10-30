import 'package:flutter/material.dart';
import 'package:picsart/src/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData get picsart {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appMenu, foregroundColor: Colors.white),
    );
  }
}
