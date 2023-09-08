import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:practice_app/simple_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hijri Calendar'),
          centerTitle: true,
        ),
        body: Center(
          child: SimpleCalendar(),
        ),
      ),
    );
  }
}

class HijriCalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HijriCalendar hijriDate = HijriCalendar.now();
    String formattedHijriDate = '${hijriDate.toFormat("dd-MM-yyyy")}';

    return Text(
      'Today in Hijri Calendar: $formattedHijriDate',
      style: TextStyle(fontSize: 18),
    );
  }
}
