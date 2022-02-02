//import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel{
  String Book_id;
  String tabletype;
  String date;
  String numberperson;
  String time;
  String additional;
  BookingModel({
    this.Book_id = '',
    required this.date,
    required this.additional,
    required this.numberperson,
    required this.time,
    required this.tabletype

  });
  BookingModel.fromJson(Map<String, dynamic> json, this.Book_id)
      : tabletype = json['tableType'] as String,
        date = json['date'] as String,
        time = json['time'] as String,
        numberperson = json['numberperson'] as String,
        additional = json['additional'] as String;

  Map<String, dynamic> toJson() {
    return {
      "Book_ID" : Book_id,
      "tableType": tabletype,
      "date": date,
      "time": time,
      "numberperson": numberperson,
      "additional": additional,
    };
  }
}

// Future createBooking({required String date, tabletype, date, numberperson, time, additional}) async{
//   final docUser = FirebaseFirestore.instance.collection('bookings').doc();
//   final booking = Booking(
//     Book_id: docUser.id,
//     tabletype = tabletype,


//   )
// }