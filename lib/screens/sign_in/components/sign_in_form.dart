import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/custom_suffix_icon.dart';
import 'package:timemanagementapp/components/default_button.dart';
import 'package:timemanagementapp/components/form_error.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:timemanagementapp/size_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildMailForm(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordForm(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              GestureDetector(
                onTap: () => setState(() {
                  remember = !remember;
                }),
                child: const Text("Remember me"),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            color: kPrimaryColor,
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordForm() {
    return TextFormField(
      obscureText: true,
      onSaved: ((newValue) => password = newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPasswordIsNullError)) {
          setState(() {
            errors.remove(kPasswordIsNullError);
          });
        } else if (value.length >= 8 &&
            errors.contains(kPasswordTooShortError)) {
          setState(() {
            errors.remove(kPasswordTooShortError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPasswordIsNullError)) {
          setState(() {
            errors.add(kPasswordIsNullError);
          });
        } else if (value.length < 8 &&
            !errors.contains(kPasswordTooShortError) &&
            value.isNotEmpty) {
          setState(() {
            errors.add(kPasswordTooShortError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        labelText: "password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(iconPath: "assets/icons/basic_lock.svg"),
      ),
    );
  }

  TextFormField buildMailForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: ((newValue) => email = newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailIsNullError)) {
          setState(() {
            errors.remove(kEmailIsNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailIsNullError)) {
          setState(() {
            errors.add(kEmailIsNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError) &&
            value.isNotEmpty) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(iconPath: "assets/icons/basic_mail.svg"),
      ),
    );
  }
}
