import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planner'),
      ),
      body: SfCalendar(
        view: CalendarView.week,
        //initialSelectedDate: DateTime.now(),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 12, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  final DateTime startTime2 =
      DateTime(today.year, today.month, today.day + 1, 9, 0, 0);
  final DateTime endTime2 = startTime2.add(const Duration(hours: 2));

  final DateTime startTime3 =
      DateTime(today.year, today.month, today.day + 3, 16, 0, 0);
  final DateTime endTime3 = startTime3.add(const Duration(hours: 3));

  final DateTime startTime4 =
      DateTime(today.year, today.month, today.day + 4, 11, 0, 0);
  final DateTime endTime4 = startTime4.add(const Duration(hours: 4));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Business Building',
      color: Colors.blue));

  meetings.add(Appointment(
      startTime: startTime2,
      endTime: endTime2,
      subject: 'Hale Library',
      color: Colors.green));

  meetings.add(Appointment(
      startTime: startTime3,
      endTime: endTime3,
      subject: 'Student Union',
      color: Colors.red));

  meetings.add(Appointment(
      startTime: startTime4,
      endTime: endTime4,
      subject: 'Engineering Building',
      color: Colors.orange));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
