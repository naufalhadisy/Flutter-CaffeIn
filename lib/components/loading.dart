import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

class Loading extends StatelessWidget {
  final String? text;
  const Loading({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: SpinKitRipple(
            color: kPrimaryColor,
            size: 60,
          ),
        ),
        Text(
          text ?? "Please wait...",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
