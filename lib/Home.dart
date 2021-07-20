import 'package:flutter/material.dart';
import 'package:nh_test_project/CustomDialog/BottomSheetDialog.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';
import 'package:nh_test_project/HomeTab.dart';
import 'package:nh_test_project/MarketTab.dart';
import 'package:nh_test_project/MypageTab.dart';
import 'package:nh_test_project/Reg_Feed.dart';
import 'package:nh_test_project/Reg_My_Feed.dart';
import 'package:nh_test_project/SearchTab.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;
  int _preIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      child: HomeTab(),
    ),
    Container(
      child: SearchTab(),
    ),
    // Container(),
    Container(/* +탭 이라 비어 있는 페이지 구현*/),
    Container(
      child: Scaffold(body: MypageTab()),
    ),
    Container(
      child: Scaffold(body: MarketTab()),
    ),
  ];

  Widget _input_popup(onPressed, imageUrl, color) {
    return IconButton(
      onPressed: onPressed,
      icon: ImageIcon(
        AssetImage(imageUrl),
        color: color,
      ),
    );
  }

  Container _my_main_appbar() {
    return Container(
      color: HexColor('#ffffff'),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 35, bottom: 0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  // margin: EdgeInsets.only(left: 19, top: 33),
                  child: Text(''),
                ),
                Expanded(
                  flex: 3,
                  //  margin: EdgeInsets.only(top: 37),
                  child: Center(
                    child: Text('LOGO'),
                    // Image(
                    //     image: AssetImage('assets/logo.png'),
                    //     fit: BoxFit.contain)
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            _selectedIndex == 0 ? _my_main_appbar() : Container(),
            Expanded(
                child: IndexedStack(
                    index: _selectedIndex, children: _widgetOptions)),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey[900],
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: HexColor('#ffffff'),
          items: <BottomNavigationBarItem>[
            _buildBottomNavigationBarItem(
                activeIconPath: "assets/home_selected.png",
                iconPath: "assets/home.png"),
            _buildBottomNavigationBarItem(
                activeIconPath: "assets/search_selected.png",
                iconPath: "assets/search.png"),
            _buildBottomNavigationBarItem(iconPath: "assets/add.png"),
            _buildBottomNavigationBarItem(
                activeIconPath: "assets/profile_selected.png",
                iconPath: "assets/profile.png"),
            _buildBottomNavigationBarItem(
                activeIconPath: "assets/heart_selected.png",
                iconPath: "assets/heart.png"),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String? activeIconPath, String? iconPath}) {
    return BottomNavigationBarItem(
      activeIcon: activeIconPath == null
          ? null
          : ImageIcon(
              AssetImage(activeIconPath),
            ),
      icon: ImageIcon(
        AssetImage(iconPath!),
      ),
      title: Text(''),
    );
  }

/*
  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 300,
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Container(
                        child: Text(
                          '추가하기',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onTap: () {
                        print('추가하기 상단 터치');
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        child: Text(
                          '내스토리에 추가하기',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
*/
  Future<dynamic?> my_dialog() async {
    final result = await BottomSheetDialog(
      context,
      [
        BottomSheetItem(
          "피드",
          Icon(Icons.share),
          'FEED',
        ),
        BottomSheetItem(
          "나의 피드",
          Icon(Icons.download),
          'MY_FEED',
        ),
      ],
      title: '',
      type: '',
    ).show();
    return result;
  }

  void _onItemTapped(int index) async {
    setState(() {
      // if (index == 2) {
      //   _preIndex = _selectedIndex;
      // } else {
      //   _selectedIndex = index;
      // }
      if (index != 2) _selectedIndex = index;
    });

    if (index == 2) {
      final result = await my_dialog();

      print(result["data"]);
      if (result["data"] == "FEED") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Reg_Feed(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Reg_My_Feed(),
          ),
        );
      }
    }
  }
}
