import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'main_screen.dart';
import 'home_screen.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  WidgetsFlutterBinding.ensureInitialized();
  try 
  {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(cameras),
      //home: MainScreen(cameras),
      routes: {
       // MainScreen.id: (context) => MainScreen(cameras),
        //DemoScreen.id: (context) => DemoScreen(),
      },
    );
  }
}
