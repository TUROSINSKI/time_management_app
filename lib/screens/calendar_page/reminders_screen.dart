import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timemanagementapp/models/Reminders/reminder_data.dart';
import 'package:timemanagementapp/models/Reminders/reminder_model.dart';

class RemindersScreen extends StatefulWidget {
  final DateTime selectedDate;

  const RemindersScreen({Key? key, required this.selectedDate}) : super(key: key);

  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  late TextEditingController _textController;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _selectedTime = TimeOfDay.now();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Note',
              ),
              minLines: 1,
              maxLines: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (picked != null && picked != _selectedTime) {
                  setState(() {
                    _selectedTime = picked;
                  });
                }
              },
              child: const Text('Select Time'),
            ),
            ElevatedButton(
              onPressed: () {
                final reminder = ReminderModel(
                  id: DateTime.now().millisecondsSinceEpoch, // or use any other unique id
                  text: _textController.text, 
                  dateTime: DateTime(
                    widget.selectedDate.year,
                    widget.selectedDate.month,
                    widget.selectedDate.day,
                    _selectedTime.hour,
                    _selectedTime.minute
                  ),
                );
                Provider.of<RemindersData>(context, listen: false).addNewReminder(reminder);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
