// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:myb_cal/HexColor/HexColor.dart';
// import 'package:myb_cal/bottom_menu.dart';
// import 'package:myb_cal/calendar.dart';
//
// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class menu1 extends StatefulWidget {
//   @override
//   _menu1Page createState() => _menu1Page();
// }
//
// class _menu1Page extends State<menu1> with SingleTickerProviderStateMixin {
//   TabController? tabController;
//   String title = "Home";
//   @override
//   void initState() {
//     super.initState();
//     tabController = new TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//         // theme: ThemeData(
//         //     primarySwatch: Colors.purple,
//         //     brightness: Brightness.light,
//         //     accentColor: Colors.red),
//         // darkTheme: ThemeData(
//         //   brightness: Brightness.dark,
//         // ),
//         home: new Scaffold(
//       body: Column(
//         children: [
//           SafeArea(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: HexColor('#ffffff'),
//                 border: Border(
//                   bottom: BorderSide(
//                     color: Colors.black,
//                     width: 1,
//                   ),
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   '밀링메이츠',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               children: <Widget>[
//                 FirstTab(),
//                 SecondTab(),
//                 // ThirdTab(),
//                 // ThirdTab()
//               ],
// // if you want yo disable swiping in tab the use below code
// //            physics: NeverScrollableScrollPhysics(),
//               controller: tabController,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Material(
//         color: HexColor('#ff7b4f'),
//         child: TabBar(
//           indicatorColor: Colors.white,
//           unselectedLabelColor: Colors.grey,
//           tabs: <Widget>[
//             Tab(
//               icon: Icon(Icons.favorite_border),
//               text: "홈",
//             ),
//             Tab(
//               icon: Icon(Icons.favorite),
//               text: "상품",
//             ),
//             Tab(
//               icon: Icon(Icons.add_box),
//               text: "내정보",
//             ),
//             Tab(
//               icon: Icon(Icons.add_box),
//               text: "내정보",
//             ),
//           ],
//           controller: tabController,
//         ),
//       ),
//     ));
//   }
// }
//
// class FirstTab extends StatefulWidget {
//   @override
//   FirstTabState createState() => FirstTabState();
// }
//
// class FirstTabState extends State<FirstTab>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;
//   int total_cnt = 6;
//   @override
//   void initState() {
//     super.initState();
//     tabController = new TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController!.dispose();
//     super.dispose();
//   }
//
//   RefreshController _refreshController =
//       RefreshController(initialRefresh: false);
//
//   void _onRefresh() async {
//     // monitor network fetch
//     print('on Refresh Start');
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use refreshFailed()
//     _refreshController.refreshCompleted();
//   }
//
//   void _onLoading() async {
//     // monitor network fetch
//     print('on Loading Start');
//     await Future.delayed(Duration(milliseconds: 1000));
//     // if failed,use loadFailed(),if no data return,use LoadNodata()
//     // items.add(
//     //     ('https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg')
//     //         .toString());
//     if (mounted)
//       setState(() {
//         total_cnt = total_cnt + 1;
//       });
//     _refreshController.loadComplete();
//   }
//
//   Widget _iconButton(onPressed, imageUrl, color) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: ImageIcon(
//         AssetImage(imageUrl),
//         color: color,
//       ),
//     );
//   }
//
//   Widget _feedHeader(int index) {
//     return Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: CircleAvatar(
//             backgroundImage: CachedNetworkImageProvider(
//                 'https://picsum.photos/id/$index/50/50'),
//             radius: 16,
//           ),
//         ),
//         Expanded(child: Text('UserName')),
//         IconButton(
//           icon: Icon(
//             Icons.more_horiz,
//             color: Colors.black87,
//           ),
//           onPressed: null,
//         )
//       ],
//     );
//   }
//
//   ImageSlideshow _mybfeedImage(int index) {
//     return ImageSlideshow(
//       width: double.infinity,
//
//       /// Height of the [ImageSlideshow].
//       height: 400,
//
//       /// The page to show when first creating the [ImageSlideshow].
//       initialPage: 0,
//
//       /// The color to paint the indicator.
//       indicatorColor: Colors.blue,
//
//       /// The color to paint behind th indicator.
//       indicatorBackgroundColor: Colors.grey,
//       children: [
//         Image.network(
//           'https://picsum.photos/id/$index/200/200',
//           fit: BoxFit.cover,
//         ),
//         Image.network(
//           'https://picsum.photos/id/$index/200/200',
//           fit: BoxFit.cover,
//         ),
//         Image.network(
//           'https://picsum.photos/id/$index/200/200',
//           fit: BoxFit.cover,
//         ),
//       ],
//       onPageChanged: (value) {
//         print('Page changed: $value');
//       },
//       // autoPlayInterval: 3000,
//     );
//   }
//
//   Row _feedAction(int index) {
//     return Row(
//       children: <Widget>[
//         _iconButton(null, 'assets/heart.png', Colors.black87),
//         _iconButton(null, 'assets/speech-bubble.png', Colors.black87),
//       ],
//     );
//   }
//
//   Padding _feedLikes(int index) {
//     return Padding(
//       padding: EdgeInsets.only(left: 14),
//       child: Text(
//         '좋아요 245개',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: MediaQuery.removePadding(
//           context: context,
//           removeTop: true,
//           child: ListView.builder(
//             itemCount: 6,
//             itemBuilder: (BuildContext context, int index) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _feedHeader(index),
//                   _mybfeedImage(index),
//                   _feedAction(index),
//                   _feedLikes(index),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondTab extends StatefulWidget {
//   @override
//   SecondTabState createState() => SecondTabState();
// }
//
// class SecondTabState extends State<SecondTab>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;
//   List<String> items = [
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//     'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = new TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController!.dispose();
//     super.dispose();
//   }
//
//   CachedNetworkImage _mybfeedImage(int index) {
//     return CachedNetworkImage(
//       imageUrl: 'https://picsum.photos/id/$index/200/200',
//       imageBuilder: (BuildContext context, ImageProvider imageProvider) {
//         return AspectRatio(
//           aspectRatio: 1,
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: imageProvider,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: MediaQuery.removePadding(
//           context: context,
//           removeTop: true,
//           child: SafeArea(
//             child: ListView.builder(
//               itemCount: 6,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           //margin: EdgeInsets.all(10),
//                           child: CircleAvatar(
//                             radius: 23.0,
//                             backgroundImage: NetworkImage(items[index]),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text('leenamho'),
//                         ),
//                       ],
//                     ),
//                     _mybfeedImage(index),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ThirdTab extends StatefulWidget {
//   @override
//   ThirdTabState createState() => ThirdTabState();
// }
//
// class ThirdTabState extends State<ThirdTab>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;
//   @override
//   void initState() {
//     super.initState();
//     tabController = new TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    // TODO: implement build
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: SafeArea(
//           child :
//         ),
//       ),
//     );
//
//
//
//   }
// }
