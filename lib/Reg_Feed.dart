import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nh_test_project/HexColor/HexColor.dart';
import 'package:sticky_headers/sticky_headers.dart';

class Reg_Feed extends StatefulWidget {
  const Reg_Feed({Key? key}) : super(key: key);

  @override
  _Reg_FeedState createState() => _Reg_FeedState();
}

class _Reg_FeedState extends State<Reg_Feed> {
  late int onLoading = 0;

  late Size _size;

  AlignmentGeometry tabAlign = Alignment.centerLeft;
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

  Future<void> _onRefreshData() async {
    print('on _onRefreshData data start');
    setState(() {
      onLoading = 0;
    });
  }

  Future<void> _onMore() async {
    print('on _onMore start');
  }

  ListView buildListView() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 100,
      itemBuilder: (context, index) => Container(
        child: Text('$index onLoading : $onLoading'),
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: CustomScrollView(
    //       slivers: [
    //         SliverList(
    //           delegate: SliverChildListDelegate(
    //             [
    //               // _header(),
    //               Container(
    //                 height: _size.height,
    //                 width: _size.width,
    //                 child: ListView.builder(
    //                   itemCount: 100,
    //                   itemBuilder: (context, index) => Container(
    //                     child: Text('$index onLoading : $onLoading'),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: new RefreshIndicator(
              displacement: 100.0,
              edgeOffset: 0.0,
              child: buildListView(),
              onRefresh: _onRefreshData,
            )),
          ],
        ),
      ),
    );
  }
}
//     return NotificationListener<ScrollNotification>(
//       onNotification: (ScrollNotification scrollInfo) {
//         if (scrollInfo.metrics.pixels >=
//             scrollInfo.metrics.maxScrollExtent - 50) {
//           print('바닥 도착');
//           setState(() {
//             onLoading = 1;
//           });
//         }
//         return false;
//       },
//       child: onLoading != 0
//           ? RefreshIndicator(
//               onRefresh: _onRefreshData,
//               child: buildListView(),
//             )
//           : buildListView(),
//     );
//
//     return Scaffold(
//       body: RefreshIndicator(
//         onRefresh: () => _onRefreshData(),
//         child: ListView.builder(
//           itemCount: 50,
//           itemBuilder: (context, index) => Container(
//             child: Text('FFFFFFF'),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//     return NotificationListener<ScrollNotification>(
//       onNotification: (ScrollNotification scrollInfo) {
//         if (scrollInfo.metrics.pixels >=
//             scrollInfo.metrics.maxScrollExtent - 50) {
//           if (ListUtils.isNotEmpty(list) &&
//               widget.infiniteLoadingListener.isMoreExist &&
//               !widget.infiniteLoadingListener.isLoading) {
//             widget.loadMore();
//             setState(() {
//               widget.infiniteLoadingListener.isLoading = true;
//             });
//           }
//         }
//         return false;
//       },
//       child: widget.onRefresh != null
//           ? RefreshIndicator(
//               onRefresh: widget.onRefresh,
//               child: buildListView(),
//             )
//           : buildListView(),
//     );
