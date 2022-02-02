import 'dart:developer';

import 'package:caffein_teamzeal/app.locator.dart';
import 'package:caffein_teamzeal/services/authentication_service.dart';
import 'package:caffein_teamzeal/services/firebase_service.dart';
import 'package:caffein_teamzeal/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';

// class BookingViewModel extends StatefulWidget {
//   @override
//   _BookingViewModel createState() => _BookingViewModel();
// }

// class _BookingViewModel extends State<BookingViewModel> {
//   FocusNode myFocusNode = FocusNode();
//   FocusNode myFocusNode1 = FocusNode();
//   FocusNode myFocusNode2 = FocusNode();
//   FocusNode myFocusNode3 = FocusNode();

//   final GlobalKey<FormState> _formKey = GlobalKey();

//   TextEditingController _datecontroller,
//       _startdatecontroller,
//       _enddatecontroller,
//       _locationcontroller,
//       _daycontroller;
//   DatabaseReference _ref;
//   @override
//   void initState() {
//     super.initState();
//     _datecontroller = TextEditingController();
//     _datecontroller.clear();
//     DateTime now = DateTime.now(); //current date
//     DateFormat formatter = DateFormat('dd-MM-yyy'); // use any format
//     String formatted = formatter.format(now);
//     _datecontroller.text = "$formatted";
//     _startdatecontroller = TextEditingController();
//     _enddatecontroller = TextEditingController();
//     _daycontroller = TextEditingController();
//     _locationcontroller = TextEditingController();

//     _ref = FirebaseDatabase.instance.reference().child('Booking');
//   }

class BookingViewModel extends BaseViewModel {
  List<bool> isExpanded = [];
  // int limit, offset;
  bool Bookings = false;
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
