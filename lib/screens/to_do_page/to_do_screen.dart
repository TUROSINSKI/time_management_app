import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/models/ToDos/todo_data.dart';
import 'package:timemanagementapp/models/ToDos/todo_model.dart';
import 'package:timemanagementapp/screens/to_do_page/components/todo_dialog.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final _controller = TextEditingController();

  void saveTodo() {
    int id = Provider.of<TodoData>(context, listen: false).getAllTodos().length;
    Provider.of<TodoData>(context, listen: false).addNewTodo(
        TodoModel(id: id, text: _controller.text, isChecked: false));
    Navigator.of(context).pop();
  }

  void createNewTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return TodoDialog(
            controller: _controller,
            onSave: saveTodo,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTodo(TodoModel todo) {
    Provider.of<TodoData>(context, listen: false).deleteTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
        builder: (context, value, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: createNewTodo,
                elevation: 0,
                backgroundColor: kPrimaryLightColor,
                shape: const StadiumBorder(
                    side: BorderSide(color: kPrimaryColor, width: 2)),
                child: const Icon(
                  Icons.add,
                  color: kPrimaryColor,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 75.0),
                    child: Text(
                      "ToDos",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CupertinoListSection.insetGrouped(
                    children: value.getAllTodos().isEmpty
                        ? [
                            Container(
                              color: CupertinoColors
                                  .systemGroupedBackground, // Set the desired background color here
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Empty todo list',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ]
                        : List.generate(
                            value.getAllTodos().length,
                            (index) => Slidable(
                              endActionPane: ActionPane(
                                  motion: const StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      backgroundColor: Colors.red,
                                      icon: Icons.delete,
                                      onPressed: (context) => deleteTodo(
                                          value.getAllTodos()[index]),
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: kPrimaryColor,
                                    value: value.getAllTodos()[index].isChecked,
                                    onChanged: (bool? newValue) {
                                      // Update the checked state of the todo
                                      value.updateTodo(index, newValue!);
                                    },
                                  ),
                                  const SizedBox(
                                      width: 8), // Adjust the spacing as needed
                                  Expanded(
                                    child: CupertinoListTile(
                                      title: Text(
                                        value.getAllTodos()[index].text,
                                        style: TextStyle(
                                          decoration: value
                                                  .getAllTodos()[index]
                                                  .isChecked
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ));
  }
}
