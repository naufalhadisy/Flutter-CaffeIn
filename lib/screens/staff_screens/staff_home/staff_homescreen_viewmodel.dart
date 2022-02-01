import 'dart:developer';

import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/app.router.dart';
import 'package:caffein_teamzeal/components/enum.dart';
import 'package:caffein_teamzeal/services/firebase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StaffHomeScreenViewModel extends BaseViewModel {
  final FirebaseService _firebaseService = locator<FirebaseService>();
}
