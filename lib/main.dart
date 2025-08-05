
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'bottom_navigation_bar/bottom_navigation_bar.dart';
import 'login_signup/login_screen.dart';
import 'dart:typed_data';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

  );
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  await Hive.openBox<Uint8List>('imageBox'); // Create box for images
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: login_screen(),
      // home: BottomBar(),
      //   initialRoute: Ro
      //   uteName.splash_screen,
      // onGenerateRoute: Routes.generateRoute,
    );

  }
}