import 'package:flutter/material.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/screens/forgot_password/components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot password",
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