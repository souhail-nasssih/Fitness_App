import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/base_app_bar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Calendar',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.transparent, // No color for today
              ),
              todayTextStyle: TextStyle(
                color: Colors.black, // Default color for today's text
              ),
            ),
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, _) => Container(
                decoration: BoxDecoration(
                  color: Colors.black, // Black background for selected day
                  shape: BoxShape.circle, // Circular shape like day 5
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(
                        color: Colors.white), // White text for selected day
                  ),
                ),
              ),
              // No styling for today
              todayBuilder: (context, date, _) => Center(
                child: Text(
                  '${date.day}',
                  style:
                      TextStyle(color: Colors.black), // Regular text for today
                ),
              ),
            ),
          )),
    );
  }
}
