import 'package:flutter/material.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({Key? key}) : super(key: key);

  @override
  _MarketTabState createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Text('여기는 상품페이지 입니다.'),
        ),
      ),
    );
  }
}
