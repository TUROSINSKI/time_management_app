import 'package:flutter/material.dart';
import 'package:timemanagementapp/components/default_button.dart';
import 'package:timemanagementapp/components/form_error.dart';
import 'package:timemanagementapp/components/not_user_yet.dart';
import 'package:timemanagementapp/constants.dart';
import 'package:timemanagementapp/size_config.dart';

import '../../../components/custom_suffix_icon.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight*0.04,),
              Text(
                "Forgot password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Enter your email so we can \nsend you a verification link",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight*0.1,),
              const ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
                  !errors.contains(kInvalidEmailError)) {
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
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          DefaultButton(
            color: kPrimaryColor,
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()){
                
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight*0.1,),
          const NotUserYet(),
        ],
      ),
    );
  }
}
