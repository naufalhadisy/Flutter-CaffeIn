import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/components/change_onboarding_screen.dart';
import 'package:caffein_teamzeal/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../components/size_config.dart';

class SigninScreenBottomText extends StatelessWidget {
  const SigninScreenBottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        ChangeOnboardingScreenText(
          textFirst: "Don't have an account? ",
          clickableText: "Sign Up",
          onPressed: () {
            locator<NavigationService>().navigateTo(Routes.signUpScreen);
          },
        ),
      ],
    );
  }
}
