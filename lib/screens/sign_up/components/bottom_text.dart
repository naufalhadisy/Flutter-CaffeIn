import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/components/change_onboarding_screen.dart';
import 'package:caffein_teamzeal/screens/sign_in/sign_in_screen.dart';
import 'package:caffein_teamzeal/screens/sign_up/components/terms_and_conditions.dart';
import 'package:flutter/material.dart';

import '../../../components/size_config.dart';

class SignupScreenBottomText extends StatelessWidget {
  const SignupScreenBottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        ChangeOnboardingScreenText(
          textFirst: "Already have an account? ",
          clickableText: "Sign In",
          onPressed: () {
            Navigator.pushNamed(context, Routes.signInScreen);
          },
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        const TermsAndConditions(),
        SizedBox(height: getProportionateScreenHeight(20)),
      ],
    );
  }
}
