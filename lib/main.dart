import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metro_guide/on_boarding/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:metro_guide/on_boarding/splash.dart';
import 'package:metro_guide/screens/Maps/riyadh.dart';
import 'package:metro_guide/screens/Maps/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Metro Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Riyadh(),
    );
  }
}
