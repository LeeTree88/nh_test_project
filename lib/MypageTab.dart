import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MypageTab extends StatefulWidget {
  const MypageTab({Key? key}) : super(key: key);

  @override
  _MypageTabState createState() => _MypageTabState();
}

class _MypageTabState extends State<MypageTab> {
  bool _menuOpenState = false;
  late Size _size;
  late double menuWidth;
  int duration = 200;
  Color btn_color = Colors.white;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  late int onLoading = 0;

  Future<void> _onRefreshData() async {
    print('on _onRefreshData data start');
    setState(() {
      onLoading = 0;
    });
  }

  Future<void> _onMore() async {
    print('on _onMore start');
  }

  // Scaffold buildListView() {
  //   if (onLoading == 0) {
  //     return Scaffold(
  //       body: SafeArea(
  //         child: CustomScrollView(
  //           slivers: [
  //             SliverList(
  //               delegate: SliverChildListDelegate(
  //                 [
  //                   _header(),
  //                   //_tabIcons(),
  //                   Container(
  //                     height: _size.height,
  //                     width: _size.width,
  //                     child: StickyHeader(
  //                       overlapHeaders: true,
  //                       header: _tabIcons(),
  //                       content: ListView.builder(
  //                         itemCount: 100,
  //                         itemBuilder: (context, index) => Container(
  //                           child: Text('onLoading : $onLoading'),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   // Container(
  //                   //   height: 500,
  //                   //   child: StickyHeader(
  //                   //     header: _tabIcons(),
  //                   //     content: ListView.builder(
  //                   //       itemCount: 50,
  //                   //       itemBuilder: (context, index) => Container(
  //                   //         child: Text('onLoading : $onLoading'),
  //                   //       ),
  //                   //     ),
  //                   //   ),
  //                   // ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Scaffold(
  //       body: ListView.builder(
  //         itemCount: 200,
  //         itemBuilder: (context, index) => Container(
  //           child: Text('onLoading 더 불러오기: $onLoading'),
  //         ),
  //       ),
  //     );
  //   }
  // }

  Widget _rightSideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      curve: Curves.linear,
      color: Colors.grey[200],
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
          _menuOpenState ? _size.width - menuWidth : _size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Text(
                  '설정',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.linear,
      color: Colors.transparent,
      duration: Duration(milliseconds: duration),
      transform:
          Matrix4.translationValues(_menuOpenState ? -menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _appBar(),
            _profileHeader(),
          ],
        ),
      ),
    );
  }

  Expanded _profileHeader() {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('FFFFFFFFFF'),
            expandedHeight: 200,
            backgroundColor: HexColor('#ffffff'),
            //    flexibleSpace: FlexibleSpaceBar(),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       _header(),
          //       //_tabIcons(),
          //       // _animatedBar(),
          //       // if (tabAlign == Alignment.centerLeft) _my_kind(),
          //       Container(
          //         height: _size.height,
          //         width: _size.width,
          //         child: ListView.builder(
          //           itemCount: 50,
          //           itemBuilder: (context, index) => Container(
          //             child: Text('onLoading : $onLoading'),
          //           ),
          //         ),
          //       ),
          //       /*
          //       StickyHeader(
          //         header: _tabIcons(),
          //         content: Container(
          //           height: _size.height,
          //           width: _size.width,
          //           child: ListView.builder(
          //             itemCount: 100,
          //             itemBuilder: (context, index) => Container(
          //               child: Text('onLoading : $onLoading'),
          //             ),
          //           ),
          //         ),
          //       ),*/
          //     ],
          //   ),
          // ),
          _getImageGrid(context)
        ],
      ),
    );
  }

  Row _tabIcons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: HexColor('#ff7b4f'),
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              onPressed: () => _setTab(true),
              color: this.tabAlign == Alignment.centerRight
                  ? Colors.grey[400]
                  : Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: HexColor('#ff7b4f'),
            child: IconButton(
              icon: ImageIcon(AssetImage('assets/saved.png')),
              onPressed: () => _setTab(false),
              color: this.tabAlign == Alignment.centerLeft
                  ? Colors.grey[400]
                  : Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _my_kind() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: btn_color,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (btn_color != Colors.red)
                      btn_color = Colors.red;
                    else
                      btn_color = Colors.white;
                  });
                },
                child: Text('아침'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: btn_color,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (btn_color != Colors.red)
                      btn_color = Colors.red;
                    else
                      btn_color = Colors.white;
                  });
                },
                child: Text('점심'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: btn_color,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (btn_color != Colors.red)
                      btn_color = Colors.red;
                    else
                      btn_color = Colors.white;
                  });
                },
                child: Text('저녁'),
              ),
            ),
            Container(
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: btn_color,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (btn_color != Colors.red)
                      btn_color = Colors.red;
                    else
                      btn_color = Colors.white;
                  });
                },
                child: Text('간식'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _setTab(bool tableLeft) {
    print(tableLeft);
    setState(() {
      if (tableLeft) {
        this.tabAlign = Alignment.centerLeft;
      } else {
        this.tabAlign = Alignment.centerRight;
      }
    });
  }

  Widget _animatedBar() {
    return AnimatedContainer(
      alignment: tabAlign,
      duration: Duration(microseconds: duration),
      curve: Curves.easeInOut,
      color: Colors.transparent,
      height: 1,
      width: _size.width,
      child: Container(
        height: 3,
        width: _size.width / 2,
        color: Colors.red,
      ),
    );
  }

  double _gridMargin = 0;

  SliverToBoxAdapter _getImageGrid(BuildContext context) {
    double _myImgGridMargin = _size.width;

    return SliverToBoxAdapter(
      child: Stack(
        children: <Widget>[
          tabAlign == Alignment.centerLeft
              ? AnimatedContainer(
                  transform: Matrix4.translationValues(_gridMargin, 0, 0),
                  duration: Duration(milliseconds: duration),
                  curve: Curves.linear,
                  child: _imageGrid(),
                )
              : AnimatedContainer(
                  transform: Matrix4.translationValues(_gridMargin, 0, 0),
                  duration: Duration(milliseconds: duration),
                  curve: Curves.linear,
                  child: _imageGrid(),
                ),
        ],
      ),
    );
  }

  GridView _imageGrid() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(30, (index) => _gridImgItem(index)),
    );
  }

  CachedNetworkImage _gridImgItem(int index) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: tabAlign == Alignment.centerLeft
          ? "https://picsum.photos/id/2/100/100"
          : "https://picsum.photos/id/3/100/100",
    );
  }

  Row _header() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(14),
          child: CircleAvatar(
            backgroundImage:
                CachedNetworkImageProvider('https://picsum.photos/id/0/50/50'),
            radius: 40,
          ),
        ),
        Expanded(
          child: Table(
            children: [
              TableRow(children: [
                _getStatusValue('473'),
                _getStatusValue('8k'),
                _getStatusValue('45k'),
              ]),
              TableRow(children: [
                _getStatusLabel('게시물'),
                _getStatusLabel('팔로워'),
                _getStatusLabel('팔로잉'),
              ])
            ],
          ),
        )
      ],
    );
  }

  Center _getStatusValue(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  Center _getStatusLabel(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

  Row _appBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              'LeeNamHo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _menuOpenState = !_menuOpenState;
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _rightSideMenu(),
          _profile(),
        ],
      ),
    );

    // return NotificationListener<ScrollNotification>(
    //   onNotification: (ScrollNotification scrollInfo) {
    //     if (scrollInfo.metrics.pixels >=
    //         scrollInfo.metrics.maxScrollExtent - 50) {
    //       print('바닥 도착');
    //       setState(() {
    //         onLoading = 1;
    //       });
    //     }
    //     return false;
    //   },
    //   child: onLoading == 0
    //       ? RefreshIndicator(
    //           onRefresh: _onRefreshData,
    //           child: _profile(),
    //         )
    //       : RefreshIndicator(
    //           onRefresh: _onMore,
    //           child: _profile(),
    //         ),
    // );

    return RefreshIndicator(
      onRefresh: _onRefreshData,
      child: _profile(),
    );
  }
}
