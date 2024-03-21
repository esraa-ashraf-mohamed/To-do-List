import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDqfx60M-yBIJsIErRYl4KIQcM91xXlsWI",
        appId: "1:116931410471:android:f1af89744042d732476c02",
        messagingSenderId: '116931410471',
        projectId: 'to-do-list-d7fe5')
  ) :
  await Firebase.initializeApp();
  // await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
      child: const MyApp(),
    create: (context) => AppProvider(),
  )
  );
}


