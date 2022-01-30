import 'package:caffein_teamzeal/components/constants.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
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
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Register Account", style: headingStyle),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
