import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:nh_test_project/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      home: mcn_main(),
    );
  }
}

class mcn_main extends StatefulWidget {
  @override
  _mcn_mainState createState() => _mcn_mainState();
}

class _mcn_mainState extends State<mcn_main> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
