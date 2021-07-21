import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';
import 'package:nh_test_project/Reg_Feed.dart';
import 'package:nh_test_project/Reg_My_Feed.dart';
import 'package:nh_test_project/follow.dart';
import 'package:nh_test_project/my_setting.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MypageTab extends StatefulWidget {
  const MypageTab({Key? key}) : super(key: key);

  @override
  _MypageTabState createState() => _MypageTabState();
}

class _MypageTabState extends State<MypageTab>
    with SingleTickerProviderStateMixin {
  bool _menuOpenState = false;
  late Size _size;
  late double menuWidth;
  int duration = 200;
  Color morning_btn_color = Colors.white;
  Color lunch_btn_color = Colors.white;
  Color evening_btn_color = Colors.white;
  Color snack_btn_color = Colors.white;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  late int onLoading = 0;
  int _tabState = 0;
  late AnimationController _staggeredController;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: FlatButton(
                  onPressed: () {
                    print('설정');
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '설정',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
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

  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    // _scrollController.addListener(_handleScrolling);
  }

  Expanded _profileHeader() {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _header(),
                    _userName(),
                    _profileComment(),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[400],
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      onTap: (index) {
                        print('index : $index');
                        setState(() {
                          _tabState = index;
                        });
                      },
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.grid_on_sharp,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.bookmark_outline,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    _tabState != 0 ? _my_kind() : Container(),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Gallery(),
                    my_Gallery(),
                    my_Gallery(),
                    // Gallery(),
                    //     Igtv(),
                    //    Reels(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _my_kind() {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: Row(
        //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: morning_btn_color,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (morning_btn_color != Colors.red)
                      morning_btn_color = Colors.red;
                    else
                      morning_btn_color = Colors.white;
                  });
                },
                child: Text('아침'),
              ),
            ),
          ),
          Expanded(
            // padding: EdgeInsets.only(right: 10),
            child: OutlinedButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: lunch_btn_color,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (lunch_btn_color != Colors.red)
                    lunch_btn_color = Colors.red;
                  else
                    lunch_btn_color = Colors.white;
                });
              },
              child: Text('점심'),
            ),
          ),
          Expanded(
            //padding: EdgeInsets.only(right: 10),
            child: OutlinedButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: evening_btn_color,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (evening_btn_color != Colors.red)
                    evening_btn_color = Colors.red;
                  else
                    evening_btn_color = Colors.white;
                });
              },
              child: Text('저녁'),
            ),
          ),
          Expanded(
            //padding: EdgeInsets.only(right: 10),
            child: OutlinedButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: snack_btn_color,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                setState(() {
                  if (snack_btn_color != Colors.red)
                    snack_btn_color = Colors.red;
                  else
                    snack_btn_color = Colors.white;
                });
              },
              child: Text('간식'),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Reg_My_Feed(),
                  ),
                );
              },
              child: InkWell(
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _get_my_feed() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 280), curve: Curves.decelerate);
    // _scrollController
    //     .jumpTo(_scrollController.position.maxScrollExtent);
  }

  Container _header() {
    return Container(
      padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            'https://picsum.photos/id/0/50/50'),
                        radius: 40,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            print('마이페이지 프로필 설정 버튼 클릭');
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/picture.png'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _get_my_feed(),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          _getStatusValue('473'),
                          _getStatusLabel('게시물'),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Follow(index: 0),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          _getStatusValue('8,000'),
                          _getStatusLabel('팔로워'),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Follow(index: 1),
                      ),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          _getStatusValue('4.5만'),
                          _getStatusLabel('팔로잉'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // child: Table(
            //   children: [
            //     TableRow(
            //       children: [
            //         GestureDetector(
            //           child: _getStatusValue('473'),
            //           onTap: () => _get_my_feed(),
            //         ),
            //         GestureDetector(
            //           child: _getStatusValue('8,000'),
            //           onTap: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (BuildContext context) => Follow(),
            //               ),
            //             );
            //           },
            //         ),
            //         _getStatusValue('4.5만'),
            //       ],
            //     ),
            //     TableRow(
            //       children: [
            //         GestureDetector(
            //           child: _getStatusLabel('게시물'),
            //           onTap: () => _get_my_feed(),
            //         ),
            //         GestureDetector(
            //           child: _getStatusLabel('팔로워'),
            //           onTap: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (BuildContext context) => Follow(),
            //               ),
            //             );
            //           },
            //         ),
            //         _getStatusLabel('팔로잉'),
            //       ],
            //     ),
            //   ],
            // ),
          )
        ],
      ),
    );
  }

  Container _userName() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
        child: Text(
          '이남호',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container _profileComment() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Text(
          '마이비 어플리케이션 프로필 만드는중!!',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
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

  Container _appBar() {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'LeeTree',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => My_setting(),
                  ),
                );
                // setState(() {
                //   _menuOpenState = !_menuOpenState;
                // });
              },
            ),
          )
        ],
      ),
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
  }
}

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late OverlayEntry _popupDialog;
  GridView _imageGrid() {
    return GridView.count(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(30, (index) => _gridImgItem(index)),
    );
  }

  CachedNetworkImage _gridImgItem(int index) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: "https://picsum.photos/id/3/100/100",
    );
  }

  List<String> imageUrls = [
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
  ];
  void loadMore() {
    print('load more ');
    setState(() {
      imageUrls = [
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/arch',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://placeimg.com/640/480/tech',
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/arch',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://placeimg.com/640/480/tech',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://placeimg.com/640/480/tech',
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/arch',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels >=
              scrollInfo.metrics.maxScrollExtent - 50) {
            loadMore();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            print('onRefresh 함수');
            setState(() {
              imageUrls = [
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
              ];
            });
          },
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 3.3,
            mainAxisSpacing: 3.3,
            children: imageUrls.map(_createGridTileWidget).toList(),
          ),
        ),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            print(
              imageUrls.indexOf(url),
            );
            print(url);
          },
          child: CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );
}

class my_Gallery extends StatefulWidget {
  const my_Gallery({Key? key}) : super(key: key);

  @override
  _my_GalleryState createState() => _my_GalleryState();
}

class _my_GalleryState extends State<my_Gallery> {
  late OverlayEntry _popupDialog;
  GridView _imageGrid() {
    return GridView.count(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(30, (index) => _gridImgItem(index)),
    );
  }

  CachedNetworkImage _gridImgItem(int index) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: "https://picsum.photos/id/3/100/100",
    );
  }

  List<String> imageUrls = [
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
  ];
  void loadMore() {
    print('load more ');
    setState(() {
      imageUrls = [
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/arch',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://placeimg.com/640/480/tech',
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/arch',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://placeimg.com/640/480/tech',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://placeimg.com/640/480/tech',
        'https://placeimg.com/640/480/animals',
        'https://placeimg.com/640/480/arch',
        'https://placeimg.com/640/480/nature',
        'https://placeimg.com/640/480/people',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
        'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels >=
              scrollInfo.metrics.maxScrollExtent - 50) {
            loadMore();
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            print('onRefresh 함수');
            setState(() {
              imageUrls = [
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
                'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
              ];
            });
          },
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 3.3,
            mainAxisSpacing: 3.3,
            children: imageUrls.map(_createGridTileWidget).toList(),
          ),
        ),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onTap: () {
            print(imageUrls.indexOf(url));
            print(url);
          },
          child: CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      );

  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://placeimg.com/640/480/people'),
        ),
        title: Text(
          'john.doe',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
            ),
          ],
        ),
      );

  Widget _createPopupContent(String url) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPhotoTitle(),
              Image.network(url, fit: BoxFit.fitWidth),
              _createActionBar(),
            ],
          ),
        ),
      );
}
