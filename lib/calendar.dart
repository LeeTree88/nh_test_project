import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class my_calendar extends StatefulWidget {
  final Color? b_color;
  const my_calendar({Key? key, this.b_color}) : super(key: key);

  @override
  _my_calendarState createState() => _my_calendarState();
}

class _my_calendarState extends State<my_calendar> {
  //_calendarController = CalendarController();

  List<String> imageList = [
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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    print("_onRefresh start");

    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    print("_onLoading start");

    _refreshController.loadComplete();
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.b_color);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropMaterialHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus status) {
                    Widget body;
                    if (status == LoadStatus.idle) {
                      body = Text("");
                    } else if (status == LoadStatus.loading) {
                      //  body = CupertinoActivityIndicator();
                      body = Container(
                        padding: EdgeInsets.only(top: 10),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
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
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.3,
                  mainAxisSpacing: 3.3,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.orange),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    onTap: () {
                      print("index on tap : $index");
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         profile_detail(user_key: items_key[index]),
                      //   ),
                      // );
                    },
                  ),
                  //     GestureDetector(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.transparent,
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(15),
                  //       ),
                  //     ),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(15),
                  //       ),
                  //       child: FadeInImage.memoryNetwork(
                  //         placeholder: kTransparentImage,
                  //         image: imageList[index],
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     print("index on tap : $index");
                  //     // Navigator.of(context).push(
                  //     //   MaterialPageRoute(
                  //     //     builder: (BuildContext context) =>
                  //     //        profile_detail(user_key: items_key[index]),
                  //     //   ),
                  //     // );
                  //   },
                  // ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(
                      index % 6 == 1 ? 2 : 1, index % 6 == 1 ? 2 : 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
