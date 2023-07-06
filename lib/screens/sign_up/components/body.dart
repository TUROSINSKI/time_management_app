import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/already_user.dart';
import 'package:timemanagementapp/components/social_bar.dart';
import 'package:timemanagementapp/screens/sign_up/components/sign_up_form.dart';
import 'package:timemanagementapp/size_config.dart';

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
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Nice to meet you!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Create your account or use socials",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              const SignUpForm(),
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
                const AlreadyUser(),
            ],
          ),
        ),
      ),
    ));
  }
}
