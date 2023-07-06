import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/default_button.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/screens/home_page/home_page_screen.dart';
import 'package:timemanagementapp/screens/sign_in/sign_in_screen.dart';
import 'package:timemanagementapp/screens/sign_up/sign_up_screen.dart';
import 'package:timemanagementapp/screens/splash/components/splash_content.dart';
import 'package:timemanagementapp/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Your time management companion",
      "image": "assets/images/multitasking.png",
    },
    {
      "text": "Note whatever you want",
      "image": "assets/images/note.png",
    },
    {
      "text": "Create your own ToDo lists",
      "image": "assets/images/checklist.png",
    },
    {
      "text": "Use simple but powerful calendar",
      "image": "assets/images/timeline.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"].toString(),
                  text: splashData[index]["text"].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                    const Spacer(flex: 3),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultButton(
                            color: kPrimaryColor,
                            text: "Sign up",
                            press: () {
                              Navigator.pushNamed(
                                  context, SignUpScreen.routeName);
                            },
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(20),
                        ),
                        Expanded(
                          child: DefaultButton(
                            color: kPrimaryColor,
                            text: "Sign in",
                            press: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
            GestureDetector(
              // onTap: ()=>Navigator.pushNamed(context, MainNavigator.routeName),
              onTap: ()=>Navigator.pushNamed(context, HomePage.routeName),
              child: const Text(
                "Continue as a guest",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kPrimaryLightColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
