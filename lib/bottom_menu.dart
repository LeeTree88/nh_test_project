// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myb_cal/calendar.dart';
// import 'package:myb_cal/menu1.dart';
//
// class bottom_menu extends StatefulWidget {
//   const bottom_menu({Key? key}) : super(key: key);
//
//   @override
//   _bottom_menuState createState() => _bottom_menuState();
// }
//
// class _bottom_menuState extends State<bottom_menu> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black.withOpacity(.60),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         currentIndex: _selectedIndex, //현재 선택된 Index
//         onTap: (int index) {
//           setState(
//             () {
//               _selectedIndex = index;
//               print(index);
//               if (index == 0) {
//                 my_calendar();
//               } else if (index == 1) {
//                 menu1();
//               }
//             },
//           );
//         },
//         items: [
//           BottomNavigationBarItem(
//             title: Text('홈'),
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             title: Text('Music'),
//             icon: Icon(Icons.music_note),
//           ),
//           BottomNavigationBarItem(
//             title: Text('Places'),
//             icon: Icon(Icons.location_on),
//           ),
//           BottomNavigationBarItem(
//             title: Text('News'),
//             icon: Icon(Icons.library_books),
//           ),
//         ],
//       ),
//       // body: Center(
//       //   child: _widgetOptions.elementAt(_selectedIndex),
//       // ),
//     );
//   }
//
//   List _widgetOptions = [
//     Text(
//       'Favorites',
//       style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
//     ),
//     Text(
//       'Music',
//       style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
//     ),
//     Text(
//       'Places',
//       style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
//     ),
//     Text(
//       'News',
//       style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
//     ),
//   ];
// }
