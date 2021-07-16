import 'package:flutter/material.dart';

class Reg_Feed extends StatefulWidget {
  const Reg_Feed({Key? key}) : super(key: key);

  @override
  _Reg_FeedState createState() => _Reg_FeedState();
}

class _Reg_FeedState extends State<Reg_Feed> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
