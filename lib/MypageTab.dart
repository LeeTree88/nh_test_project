import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';
import 'package:nh_test_project/Reg_Feed.dart';
import 'package:nh_test_project/Reg_My_Feed.dart';
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
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _header(),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
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
                  ],
                ),
              ),
              _my_kind(),
              Expanded(
                child: TabBarView(
                  children: [
                    Gallery(),
                    Reg_My_Feed(),
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
      // CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       title: Text('FFFFFFFFFF'),
      //       expandedHeight: 200,
      //       backgroundColor: HexColor('#ffffff'),
      //
      //       //    flexibleSpace: FlexibleSpaceBar(),
      //     ),
      //     // SliverGrid(delegate: delegate, gridDelegate: gridDelegate)
      //     // SliverList(
      //     //   delegate: SliverChildListDelegate(
      //     //     [
      //     //       _header(),
      //     //       //_tabIcons(),
      //     //       // _animatedBar(),
      //     //       // if (tabAlign == Alignment.centerLeft) _my_kind(),
      //     //       Container(
      //     //         height: _size.height,
      //     //         width: _size.width,
      //     //         child: ListView.builder(
      //     //           itemCount: 50,
      //     //           itemBuilder: (context, index) => Container(
      //     //             child: Text('onLoading : $onLoading'),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //       /*
      //     //       StickyHeader(
      //     //         header: _tabIcons(),
      //     //         content: Container(
      //     //           height: _size.height,
      //     //           width: _size.width,
      //     //           child: ListView.builder(
      //     //             itemCount: 100,
      //     //             itemBuilder: (context, index) => Container(
      //     //               child: Text('onLoading : $onLoading'),
      //     //             ),
      //     //           ),
      //     //         ),
      //     //       ),*/
      //     //     ],
      //     //   ),
      //     // ),
      //     //   _getImageGrid(context)
      //   ],
      // ),
    );
  }

  // Row _tabIcons() {
  //   return Row(
  //     children: <Widget>[
  //       Expanded(
  //         child: Container(
  //           color: HexColor('#ff7b4f'),
  //           child: IconButton(
  //             icon: ImageIcon(AssetImage('assets/grid.png')),
  //             onPressed: () => _setTab(true),
  //             color: this.tabAlign == Alignment.centerRight
  //                 ? Colors.grey[400]
  //                 : Colors.white,
  //           ),
  //         ),
  //       ),
  //       Expanded(
  //         child: Container(
  //           color: HexColor('#ff7b4f'),
  //           child: IconButton(
  //             icon: ImageIcon(AssetImage('assets/saved.png')),
  //             onPressed: () => _setTab(false),
  //             color: this.tabAlign == Alignment.centerLeft
  //                 ? Colors.grey[400]
  //                 : Colors.white,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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

  Container _header() {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14),
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                  'https://picsum.photos/id/0/50/50'),
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
            print(imageUrls.indexOf(url));
          },
          // onLongPress: () {
          //   _popupDialog = _createPopupDialog(url);
          //   Overlay.of(context)!.insert(_popupDialog);
          // },
          //   onLongPressEnd: (details) => _popupDialog.remove(),
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

  OverlayEntry _createPopupDialog(String url) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(url),
      ),
    );
  }

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

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
