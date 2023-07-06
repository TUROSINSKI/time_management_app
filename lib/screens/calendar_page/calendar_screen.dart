import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timemanagementapp/models/Reminders/reminder_data.dart';
import 'package:timemanagementapp/models/Reminders/reminder_model.dart';
import 'package:timemanagementapp/screens/calendar_page/reminders_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void deleteReminder(ReminderModel todo) {
    Provider.of<RemindersData>(context, listen: false).deleteReminder(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        firstDay: DateTime.utc(2020, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Notes'),
                content: Consumer<RemindersData>(
                  builder: (context, remindersData, child) {
                    final reminders =
                        remindersData.getRemindersForDate(selectedDay);

                    if (reminders.isEmpty) {
                      return const Text('No notes for this day.');
                    }

                    return ListView.builder(
                      itemCount: reminders.length,
                      itemBuilder: (context, index) {
                        final note = reminders[index];
                        final timeFormat = DateFormat
                            .jm(); // 'jm' will give you something like '5:30 PM'
                        final String formattedTime =
                            timeFormat.format(note.dateTime);

                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                backgroundColor: Colors.red,
                                icon: Icons.delete,
                                onPressed: (context) => deleteReminder(
                                    remindersData.getRemindersForDate(
                                        selectedDay)[index]),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(note.text),
                            subtitle: Text(formattedTime),
                          ),
                        );
                      },
                    );
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Add Note'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RemindersScreen(selectedDate: selectedDay)),
                      );
                    },
                  ),
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        calendarStyle: const CalendarStyle(
          // Use `CalendarStyle` to customize the UI
          selectedDecoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
