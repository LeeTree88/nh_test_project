import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeTab extends StatefulWidget {
  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int total_cnt = 6;
  bool is_liked = true;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    print('HomeTab on Refresh Start');
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    print('HomeTab on Loading Start');
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add(
    //     ('https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg')
    //         .toString());
    if (mounted)
      setState(() {
        total_cnt = total_cnt + 1;
      });
    _refreshController.loadComplete();
  }

  Widget _iconButton(onPressed, imageUrl, color) {
    return IconButton(
      onPressed: onPressed,
      icon: ImageIcon(
        AssetImage(imageUrl),
        color: color,
      ),
    );
  }

  Widget _feedHeader(int index) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                'https://picsum.photos/id/$index/50/50'),
            radius: 16,
          ),
        ),
        Expanded(child: Text('LeeNamho')),
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  Stack _mybfeedImage(int index, double width, double height) {
    return Stack(
      children: [
        ImageSlideshow(
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: height * 0.4,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          children: [
            Image.asset(
              'assets/food_1.jpeg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/food_1.jpeg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/food_1.jpeg',
              fit: BoxFit.cover,
            ),
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
            print('homeTab index = $index');
          },
          // autoPlayInterval: 3000,
        ),
        Positioned(
          top: (height * 0.4) - 40,
          left: width - 40,
          child: GestureDetector(
            onTap: () {
              print('index : $index');
            },
            child: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/shopping-bag.png'),
            ),
          ),
        ),
      ],
    );
  }

  void like_tap() {}
  Row _feedAction(int index) {
    return Row(
      children: <Widget>[
        _iconButton(() {
          setState(() {
            if (is_liked == false) {
              is_liked = true;
            } else {
              is_liked = false;
            }
          });
        }, is_liked == false ? 'assets/heart.png' : 'assets/heart_selected.png',
            Colors.black87),
        _iconButton(null, 'assets/speech-bubble.png', Colors.black87),
      ],
    );
  }

  Padding _feedLikes(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 14),
      child: Text(
        '좋아요 245개',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding _feedCaption(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child:
          // Column(
          //   children: [
          //     Container(
          //       child: ExpandableText(
          //         '$index 맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~',
          //         expandText: '더 보기',
          //         collapseText: '닫기',
          //       ),
          //     ),
          //   ],
          // ),
          RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: 'mybmeal$index',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: '  '),
            TextSpan(
              text:
                  '맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~맛있어요!~~~~~~~~~~~~~~~~~',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropMaterialHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? status) {
                Widget body;
                if (status == LoadStatus.idle) {
                  body = Text("");
                } else if (status == LoadStatus.loading) {
                  //  body = CupertinoActivityIndicator();
                  body = Container(
                    padding: EdgeInsets.only(top: 10),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  );
                } else if (status == LoadStatus.failed) {
                  body = Text("");
                } else if (status == LoadStatus.canLoading) {
                  body = Text("");
                } else {
                  body = Text("");
                }
                return Container(
                  //  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _feedHeader(index),
                    _mybfeedImage(index, width, height),
                    _feedAction(index),
                    _feedLikes(index),
                    _feedCaption(context, index),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
