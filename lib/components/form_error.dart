import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timemanagementapp/size_config.dart';


class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index])), 
    );
  }

  Row formErrorText({required String error}) {
    return Row(
        children: [
          SvgPicture.asset(
            "assets/icons/warning-sign-9746.svg",
            height: getProportionateScreenWidth(18),
            width: getProportionateScreenWidth(18),
          ),
          SizedBox(width: getProportionateScreenWidth(5),),
          Text(error)
        ],
      );
  }
}
