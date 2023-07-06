import 'package:flutter/material.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/screens/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}