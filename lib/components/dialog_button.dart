import 'package:flutter/material.dart';
import 'package:timemanagementapp/constants.dart';

class DialogButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  
  DialogButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(side: BorderSide.none),
      onPressed: onPressed,
      color: kPrimaryColor,
      child: Text(text),
    );
  }
}