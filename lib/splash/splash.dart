import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:nh_test_project/Home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool auto_login_chk = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => home(),
              ),
            ));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.png'), fit: BoxFit.cover),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Container(
        //               margin: EdgeInsets.only(left: 25.0, top: 37.0),
        //               constraints: BoxConstraints(maxWidth: 180),
        //               width: width * 0.33,
        //               child: Image(
        //                   image: AssetImage('assets/beaus.png'),
        //                   fit: BoxFit.contain),
        //             ),
        //           ],
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Container(
        //               padding: EdgeInsets.only(top: 10, left: 25),
        //               child: Text(
        //                 '나만의 뷰티스타일 , 뷰스',
        //                 style: TextStyle(
        //                   fontSize: 12,
        //                   color: HexColor('#000000'),
        //                   fontWeight: FontWeight.bold,
        //                   fontFamily: 'NanumSquareOTFR',
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         Container(
        //           padding: EdgeInsets.only(bottom: 34),
        //           child: Center(
        //             child: Text(
        //               'Copyright. 2021 MCN Company All rights reserved.',
        //               style: TextStyle(
        //                 fontSize: 12,
        //                 color: HexColor('#000000'),
        //                 fontWeight: FontWeight.bold,
        //                 fontFamily: 'NanumSquareOTFR',
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     )
        //   ],
        // ),
      ),
    );
  }
}
