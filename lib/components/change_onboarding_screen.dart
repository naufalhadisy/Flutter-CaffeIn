import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ChangeOnboardingScreenText extends StatelessWidget {
  const ChangeOnboardingScreenText({
    Key? key,
    this.textFirst,
    this.clickableText,
    this.onPressed,
  }) : super(key: key);

  final String? textFirst;
  final String? clickableText;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textFirst,
        style: TextStyle(color: Colors.white),
        children: [
          TextSpan(
            text: clickableText,
            style: const TextStyle(color: kSecondaryColor),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
