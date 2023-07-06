import 'package:flutter/widgets.dart';
import 'package:timemanagementapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:timemanagementapp/screens/home_page/home_page_screen.dart';
import 'package:timemanagementapp/screens/sign_in/sign_in_screen.dart';
import 'package:timemanagementapp/screens/sign_up/sign_up_screen.dart';
import 'package:timemanagementapp/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomePage.routeName: (context) => const HomePage(),
};