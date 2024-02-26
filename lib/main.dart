import 'package:flutter/material.dart';
import 'package:todo_list/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
