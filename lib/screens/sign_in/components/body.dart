import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/social_bar.dart';
import 'package:timemanagementapp/screens/sign_in/components/sign_in_form.dart';
import 'package:timemanagementapp/size_config.dart';

import '../../../components/not_user_yet.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight*0.04,
                ),
                Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your RemindR account \nor use socials to continue",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight*0.08,
                ),
                const SignInForm(),
                SizedBox(
                  height: SizeConfig.screenHeight*0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/icons8-facebook.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/icons8-google.svg",
                      press: () {},
                    ),
                    SocialCard(
                      icon: "assets/icons/icons8-twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20),),
                const NotUserYet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
