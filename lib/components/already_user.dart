import 'package:flutter/material.dart';
import 'package:timemanagementapp/screens/sign_in/sign_in_screen.dart';

import '../constants.dart';
import '../size_config.dart';


class AlreadyUser extends StatelessWidget {
  const AlreadyUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have account? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, SignInScreen.routeName),
          child: Text(
            "Sign in",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
