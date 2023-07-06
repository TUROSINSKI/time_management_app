import 'package:flutter/material.dart';
import 'package:timemanagementapp/screens/sign_in/components/body.dart';

import '../../constants.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign in",
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
