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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Coding with curry'),
            backgroundColor: Colors.deepPurple,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://picsum.photos/id/0/50/50',
                  fit: BoxFit.cover),
            ),
          ),
        ],
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
