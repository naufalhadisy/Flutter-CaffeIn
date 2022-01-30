import 'package:caffein_teamzeal/components/loading.dart';
import 'package:caffein_teamzeal/components/size_config.dart';
import 'package:caffein_teamzeal/screens/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (viewModel) => viewModel.checkAuthentification(),
      builder: (context, viewModel, child) {
        SizeConfig().init(context);

        return const Scaffold(
          body: Loading(),
        );
      },
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
