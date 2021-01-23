import 'package:flutter/material.dart';

class calender extends StatefulWidget {
  @override
  _calenderState createState() => _calenderState();
}

class _calenderState extends State<calender> {

  Color primaryColor = Color(0xff18203d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Calender"),
    ));
  }
}
