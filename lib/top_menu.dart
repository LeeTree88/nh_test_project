// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myb_cal/HexColor/HexColor.dart';
// import 'package:myb_cal/calendar.dart';
// import 'package:myb_cal/menu1.dart';
//
// class top_menu extends StatelessWidget {
//   const top_menu({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // theme: ThemeData(
//       //   primarySwatch: Colors.orange,
//       // ),
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           bottomNavigationBar: new Material(
//               color: Colors.orange,
//               child: TabBar(
//                 indicatorColor: HexColor('#ffffff'),
//                 labelStyle: TextStyle(
//                   fontSize: 14,
//                 ),
//                 labelColor: Colors.white,
//                 tabs: <Tab>[
//                   Tab(
//                     text: '홈',
//                     icon: Icon(
//                       Icons.home,
//                       size: 18,
//                     ),
//                   ),
//                   Tab(
//                     text: '상품',
//                     icon: Icon(
//                       Icons.production_quantity_limits,
//                       size: 18,
//                     ),
//                   ),
//                   Tab(
//                     text: '내정보',
//                     icon: Icon(
//                       Icons.person,
//                       size: 18,
//                     ),
//                   ),
//                   Tab(
//                     text: '등록',
//                     icon: Icon(
//                       Icons.camera_alt,
//                       size: 18,
//                     ),
//                   ),
//                 ],
//               )),
//           body: TabBarView(
//             children: [
//               Center(
//                 child: my_calendar(b_color: Colors.white10),
//               ),
//               Center(
//                 child: menu1(),
//               ),
//               Center(
//                 child: Text('BIRDS'),
//               ),
//               Center(
//                 child: Text('BIRDS'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// //
// // class top_menu extends StatefulWidget {
// //   const top_menu({Key? key}) : super(key: key);
// //
// //   @override
// //   _top_menuState createState() => _top_menuState();
// // }
// //
// // class _top_menuState extends State<top_menu>
// //     with SingleTickerProviderStateMixin {
// //   int _tabIndex = 0;
// //
// //   late TabController _tabController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(vsync: this, length: 4);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       // theme: ThemeData(
// //       //   primarySwatch: Colors.orange,
// //       // ),
// //       home: DefaultTabController(
// //         length: 4,
// //         child: Scaffold(
// //           bottomNavigationBar: SizedBox(
// //             height: 50,
// //             child: new Material(
// //                 color: Colors.orange,
// //                 child: TabBar(
// //                   indicatorColor: HexColor('#ffffff'),
// //                   labelStyle: TextStyle(fontSize: 14),
// //                   tabs: <Tab>[
// //                     Tab(
// //                       text: '홈',
// //                       icon: Icon(
// //                         Icons.home,
// //                         size: 18,
// //                       ),
// //                     ),
// //                     Tab(
// //                       text: '상품',
// //                       icon: Icon(
// //                         Icons.production_quantity_limits,
// //                         size: 18,
// //                       ),
// //                     ),
// //                     Tab(
// //                       text: '내정보',
// //                       icon: Icon(
// //                         Icons.person,
// //                         size: 18,
// //                       ),
// //                     ),
// //                     Tab(
// //                       text: '등록',
// //                       icon: Icon(
// //                         Icons.camera_alt,
// //                         size: 18,
// //                       ),
// //                     ),
// //                   ],
// //                 )),
// //           ),
// //           body: TabBarView(
// //             children: [
// //               Center(
// //                 child: my_calendar(b_color: Colors.white24),
// //               ),
// //               Center(
// //                 child: menu1(),
// //               ),
// //               Center(
// //                 child: Text('BIRDS'),
// //               ),
// //               Center(
// //                 child: Text('BIRDS'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
