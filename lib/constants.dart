import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF3F6634);
const kPrimaryLightColor = Color(0xFFd6ffb7);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFDE6B48),
      Color(0xFFE5B181),
    ]);
const kSecondaryColor = Color(0xFF523A34);
const kTextColor = Color(0xFF101B0E);
const kAnimationDuration = Duration(milliseconds: 200);

final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailIsNullError = "Enter your email!";
const String kInvalidEmailError = "You've entered an invalid email!";
const String kPasswordIsNullError = "Enter your password!";
const String kPasswordTooShortError = "Your password is too short!";
const String kPasswordsDontMatchError = "Passwords don't match";