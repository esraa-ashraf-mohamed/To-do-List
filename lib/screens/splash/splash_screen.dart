import 'package:flutter/material.dart';
import 'package:todo_list/utils/app_assets.dart';

import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    viewSplashScreen();
  }
  void viewSplashScreen(){
    Future.delayed(
      const Duration(seconds: 4),
          () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        AppAssets.splash,
      fit: BoxFit.fill,
    );
  }
}
