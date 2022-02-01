import 'package:caffein_teamzeal/screens/sign_in/staff_sign_in/staff_body_sign_in.dart';
import 'package:flutter/material.dart';

import '../../../components/size_config.dart';

class StaffSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: StaffBody(),
    );
  }
}
