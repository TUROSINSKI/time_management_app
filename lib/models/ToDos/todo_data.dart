import 'package:flutter/material.dart';
import 'package:timemanagementapp/models/ToDos/todo_model.dart';

class TodoData extends ChangeNotifier{
  List<TodoModel> allTodos = [
    TodoModel(id: 0, text: 'First note', isChecked: false),
    TodoModel(id: 1, text: 'Second note', isChecked: false),
  ];

  List<TodoModel> getAllTodos(){
    return allTodos;
  }

  void updateTodo(int index, bool isChecked) {
    allTodos[index].isChecked = isChecked;
    notifyListeners();
  }

  void addNewTodo(TodoModel todo){
    allTodos.add(todo);
    notifyListeners();
  }

  void deleteTodo(TodoModel todo){
    allTodos.remove(todo);
    notifyListeners();
  }
}