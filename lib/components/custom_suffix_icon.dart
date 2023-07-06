import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timemanagementapp/size_config.dart';

class CustomSuffix extends StatelessWidget {
  const CustomSuffix({
    super.key,
    required this.iconPath,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0,
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(20),
          getProportionateScreenWidth(10)),
      child: SvgPicture.asset(
        iconPath,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}