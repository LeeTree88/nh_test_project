import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:nh_test_project/HexColor/HexColor.dart';

class Reg_My_Feed extends StatefulWidget {
  const Reg_My_Feed({Key? key}) : super(key: key);

  @override
  _Reg_My_FeedState createState() => _Reg_My_FeedState();
}

class _Reg_My_FeedState extends State<Reg_My_Feed> {
  DateTime? _currentDate;

  static Widget _eventIcon = new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        // border: Border.all(color: Colors., width: 2.0),
      ),
      child: SizedBox(
        height: 20,
        width: 20,
        child: Image.asset(
          'assets/heart.png',
          fit: BoxFit.cover,
        ),
      )
      /*new Icon(
      Icons.person,
      color: Colors.amber,
    ),*/
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2021, 7, 10): [
        new Event(
          date: new DateTime(2021, 7, 10),
          title: 'Event 1',
          //  icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.green,
            height: 5.0,
            width: 5.0,
          ),
        ),
        // new Event(
        //     date: new DateTime(2021, 7, 10),
        //     title: 'Event 2',
        //     icon: _eventIcon),
        // new Event(
        //   date: new DateTime(2021, 7, 10),
        //   title: 'Event 3',
        //   icon: _eventIcon,
        // ),
      ],
    },
  );

  Widget get_calendar(double height) {
    return Expanded(
      //   margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events) {
          this.setState(() => _currentDate = date);
          events.forEach((event) => print(event.title));
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.white,
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
        customDayBuilder: (
          /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:

          // if (day.day == 15) {
          //   return Center(
          //     child: Icon(Icons.home),
          //   );
          // } else {
          //   return null;
          // }
        },

        //markedDateShowIcon: false,
        showIconBehindDayText: true,
        markedDateIconBuilder: (event) {
          return event.icon;
        },
        daysTextStyle: TextStyle(color: Colors.blue),
        selectedDayButtonColor: Colors.white,
        selectedDayBorderColor: HexColor('#ff7b4f'),
        daysHaveCircularBorder: true,
        weekFormat: false,
        markedDatesMap: _markedDateMap,
        height: height * 0.55,
        selectedDateTime: _currentDate,
        locale: 'ko',

        /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child: get_calendar(height),
            ),
          ],
        ),
      ),
    );
  }
}
