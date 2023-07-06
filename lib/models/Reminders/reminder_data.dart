import 'package:flutter/material.dart';
import 'package:timemanagementapp/models/Reminders/reminder_model.dart';

class RemindersData extends ChangeNotifier {
  final List<ReminderModel> _notes = [];

  List<ReminderModel> get notes => _notes;

  List<ReminderModel> getRemindersForDate(DateTime date) {
    return _notes.where((reminder) =>
        reminder.dateTime.year == date.year &&
        reminder.dateTime.month == date.month &&
        reminder.dateTime.day == date.day
    ).toList();
  }

  void addNewReminder(ReminderModel reminder) {
    _notes.add(reminder);
    notifyListeners();
  }

  void updateReminderText(ReminderModel reminder, String newText) {
    final index = _notes.indexOf(reminder);
    if(index != -1){
      _notes[index] = reminder.copyWith(text: newText);
      notifyListeners();
    }
  }

  void deleteReminder(ReminderModel reminder) {
    _notes.remove(reminder);
    notifyListeners();
  }
}

