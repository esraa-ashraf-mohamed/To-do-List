import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/screens/edit_task/edit_task.dart';
import 'package:todo_list/screens/home_screen/home_screen.dart';
import 'package:todo_list/screens/splash/splash_screen.dart';
import 'package:todo_list/utils/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightMode,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        HomeScreen.routeName : (_) => const HomeScreen(),
        EditTask.routeName : (_) => const EditTask()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
