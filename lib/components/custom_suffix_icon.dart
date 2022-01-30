import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        getProportionateScreenWidth(15),
        getProportionateScreenWidth(15),
        getProportionateScreenWidth(10),
        getProportionateScreenWidth(15),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenWidth(12),
      ),
    );
  }
}
