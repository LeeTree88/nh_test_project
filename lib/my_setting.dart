import 'package:flutter/material.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';

class My_setting extends StatefulWidget {
  const My_setting({Key? key}) : super(key: key);

  @override
  _My_settingState createState() => _My_settingState();
}

class _My_settingState extends State<My_setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                color: HexColor('#ffffff'),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 35, bottom: 7),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            // margin: EdgeInsets.only(left: 19, top: 33),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(
                                      'assets/small_back_btn_orange.png'),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            //  margin: EdgeInsets.only(top: 37),
                            child: Center(
                              child: Text(
                                '설정',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'NanumSquareOTFB',
                                    color: HexColor('#000000')),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('개인정보 처리 방침'),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('개인정보 처리 방침'),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('개인정보 처리 방침'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
