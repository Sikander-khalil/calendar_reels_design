import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hijri/hijri_calendar.dart';

class SimpleCalendar extends StatefulWidget {
  const SimpleCalendar({Key? key}) : super(key: key);

  @override
  State<SimpleCalendar> createState() => _SimpleCalendarState();
}

class _SimpleCalendarState extends State<SimpleCalendar> {
  DateTime selectedDate = DateTime.now();
  HijriCalendar hijriDate = HijriCalendar.now();

  void _onDaySelected(DateTime day, DateTime? focusDay) {
    setState(() {
      selectedDate = day;
      hijriDate = HijriCalendar.fromDate(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            hijriDate.longMonthName +
                ' ' +
                hijriDate.hDay.toString() +
                ' ' +
                hijriDate.hYear.toString() +
                ' ' +
                'AH',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TableCalendar(
              selectedDayPredicate: (day) => isSameDay(day, selectedDate),
              onDaySelected: _onDaySelected,
              focusedDay: selectedDate,
              calendarFormat: CalendarFormat.month,
              headerVisible: false,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              rowHeight: 65,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, _) {
                  final hijriDateForDay = HijriCalendar.fromDate(date);

                  return Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text(
                            '${hijriDateForDay.hDay}',
                            style: TextStyle(
                              fontSize: 20,
                              color: isSameDay(date, selectedDate)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 14,
                          color: isSameDay(date, selectedDate)
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
                selectedBuilder: (context, date, _) {
                  final hijriDateForDay = HijriCalendar.fromDate(date);

                  return Column(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            '${hijriDateForDay.hDay}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
                todayBuilder: (context, date, _) {
                  final hijriDateForDay = HijriCalendar.fromDate(date);

                  return Column(
                    children: [
                      Center(
                        child: Text(
                          '${hijriDateForDay.hDay}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
