import 'package:flutter/material.dart';
import 'package:todo_list/utils/app_colors.dart';

class AppThemes{

  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: AppColors.grayColorLight,
      ),
    ),
  );
}