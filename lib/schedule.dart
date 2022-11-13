import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: SafeArea(
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 20),
          lastDay: DateTime.utc(2040, 10, 20),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: ((selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }),
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
        ),
      ),
    );
  }
}
