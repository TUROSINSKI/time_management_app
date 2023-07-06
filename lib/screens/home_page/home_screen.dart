import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timemanagementapp/models/Reminders/reminder_data.dart';
import 'package:timemanagementapp/models/ToDos/todo_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get all notes, todos, and reminders
    final allTodos = Provider.of<TodoData>(context).getAllTodos();
    final todayReminders = Provider.of<RemindersData>(context).getRemindersForDate(DateTime.now());

    final latestTodo = allTodos.isNotEmpty ? allTodos.last : null;
    final todayReminder = todayReminders.isNotEmpty ? todayReminders.first : null;
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: screenWidth*0.5,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xFFa2f1d5),
                    border: Border.all(
                        color: const Color(0xFF5A5A5A),
                        width: 2.0,
                      ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Reminder', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(todayReminder?.text ?? 'No reminders'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: screenWidth*0.5,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color(0xFFd6a2f1),
                    border: Border.all(
                        color: const Color(0xFF5A5A5A),
                        width: 2.0,
                      ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Latest Todo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(latestTodo?.text ?? 'No todos yet'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
