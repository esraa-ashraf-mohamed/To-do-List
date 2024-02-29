import 'package:flutter/material.dart';
import 'package:todo_list/utils/app_colors.dart';

class AppThemes{

  static TextStyle appBarTitle = TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold);
  static TextStyle titleText = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColorLight);
  static TextStyle regularText = TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: AppColors.grayColorLight);


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