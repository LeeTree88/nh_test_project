import 'package:flutter/material.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  bool isSwitched = false;

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
                                '개인정보 처리 방침',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'NanumSquareOTFB',
                                  color: HexColor('#000000'),
                                ),
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
                padding: EdgeInsets.only(left: 25, right: 25, top: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: HexColor('#ea5412'),
                                  fontFamily: 'NanumSquareOTFB',
                                ),
                              ),
                              TextSpan(
                                text: '이름',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: HexColor('#000000'),
                                  fontFamily: 'NanumSquareOTFB',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 23),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 5),
                          isDense: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: HexColor('#b9b9b9')),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: HexColor('#b9b9b9')),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
