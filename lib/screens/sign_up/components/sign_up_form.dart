import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/custom_suffix_icon.dart';
import 'package:timemanagementapp/components/default_button.dart';
import 'package:timemanagementapp/components/form_error.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/size_config.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? pass;
  bool passVisibility = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUsernameForm(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildMailForm(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordForm(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordForm(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: passVisibility,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           passVisibility = value!;
          //         });
          //       },
          //     ),
          //     const Text("Show password"),
          //   ],
          // ),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10),),
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
      obscureText: !passVisibility,
      onSaved: ((newValue) => password = newValue!),
      onChanged: (value) {
        if (value.isNotEmpty){
          pass = value;
        }
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
            !errors.contains(kPasswordTooShortError) && pass != null) {
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

  TextFormField buildConfirmPasswordForm() {
    return TextFormField(
      obscureText: !passVisibility,
      onSaved: ((newValue) => password = newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPasswordIsNullError)) {
          setState(() {
            errors.remove(kPasswordIsNullError);
          });
        } else if (value == pass && errors.contains(kPasswordsDontMatchError)){ 
          setState(() {
            errors.remove(kPasswordsDontMatchError);
          });
        }
      },
      validator: (value) {
        if (value != pass && !errors.contains(kPasswordsDontMatchError) && pass != null){
          setState(() {
            errors.add(kPasswordsDontMatchError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        labelText: "confirm password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSuffix(iconPath: "assets/icons/basic_lock.svg"),
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
            !errors.contains(kInvalidEmailError) && value.isNotEmpty) {
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


  TextFormField buildUsernameForm() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: "username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(iconPath: "assets/icons/basic_mail.svg"),
      ),
    );
  }
}
