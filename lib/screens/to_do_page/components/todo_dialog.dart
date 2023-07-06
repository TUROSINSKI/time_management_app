import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/dialog_button.dart';
import 'package:timemanagementapp/size_config.dart';

class TodoDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  TodoDialog({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: getProportionateScreenHeight(135),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a ToDo',
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogButton(onPressed: onCancel, text: "Cancel"),
                DialogButton(onPressed: onSave, text: "Save"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
