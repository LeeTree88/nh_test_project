import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';
import 'package:nav/nav.dart';
import 'package:nh_test_project/CustomDialog/PressedChangeButton.dart';

class BottomSheetItem {
  final String title;
  final Icon icon;
  final String type;

  BottomSheetItem(this.title, this.icon, this.type);
}

class BottomSheetDialog extends DialogWidget {
  static const DATA = "data";
  final List<BottomSheetItem> bottomSheetItemList;
  final String title;
  final String type;
  final bool showCancel;
  final NavAni ani = NavAni.Bottom;
  final MainAxisAlignment mainAxisAlignment;
  final bool barrierDismissible = true;

  BottomSheetDialog(BuildContext context, this.bottomSheetItemList,
      {this.showCancel = false,
      required this.title,
      required this.type,
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(context);

  @override
  State<StatefulWidget> createState() {
    return _DialogState(onHide);
  }
}

class _DialogState extends DialogState<BottomSheetDialog> {
  var isChecked = false;
  String selectedTitle = '';

  _DialogState(Function() onHide) : super(onHide);

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(10);
    final mediaQuery = MediaQuery.of(context);
    final viewPaddingBottom = mediaQuery.viewPadding.bottom;
    final width = mediaQuery.size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (widget.barrierDismissible) {
            widget.hide();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: viewPaddingBottom + 10, top: 10),
              width: width,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: radius, topRight: radius)),
              child: Column(
                children: <Widget>[
                  if (widget.title != null)
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 14.0),
                    //   child: Text(widget.title,
                    //       style: TextStyle(
                    //           color: Color(0xff777777),
                    //           fontWeight: FontWeight.bold)),
                    // ),
                    ...getItemList(context),
                  if (widget.showCancel)
                    PressedChangeButton(
                      onTap: () {
                        setState(() {
                          selectedTitle = "Cancel";
                        });
                        Nav.pop(context, result: {
                          Nav.RESULT: Nav.SUCCESS,
                          BottomSheetDialog.DATA: "Cancel"
                        });
                      },
                      forcePressedColor: selectedTitle == "Cancel",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getItemList(BuildContext context) {
    List<Widget> list = [];
    widget.bottomSheetItemList.forEach((item) {
      list.add(PressedChangeButton(
        onTap: () {
          setState(() {
            selectedTitle = item.title;
          });
          widget.hide(
              {Nav.RESULT: Nav.SUCCESS, BottomSheetDialog.DATA: item.type});
        },
        forcePressedColor: selectedTitle == item.title,
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: <Widget>[
            if (item.icon != null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: item.icon,
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(item.title),
            )
          ],
        ),
      ));
    });
    return list;
  }
}
