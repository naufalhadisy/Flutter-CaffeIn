import 'dart:developer';

import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/services/authentication_service.dart';
import 'package:caffein_teamzeal/services/firebase_service.dart';
import 'package:caffein_teamzeal/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';

class BookingHistoryViewModel extends BaseViewModel {
  List<bool> isExpanded = [];
  // int limit, offset;
  bool hasBookings = false;
  bool screenLoading = true;
  bool loadMore = false;
  bool loadingMore = false;
  List bookingDetails = [];
  List moreBookingDetails = [];

  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();
  final FirebaseService _firebaseService = locator<FirebaseService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  void updateIsExpanded(int index) {
    isExpanded[index] = !isExpanded[index];
    notifyListeners();
  }
}
