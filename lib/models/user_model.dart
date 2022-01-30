class UserModel {
  final String? id;
  final String name;
  final String phone;
  final String email;
  List? booking;

  UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.booking,
  });

  UserModel.fromJson(Map<String, dynamic> json, this.id)
      : name = json['name'] as String,
        phone = json['phone'] as String,
        email = json['email'] as String,
        booking = json['booking'] as List?;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "email": email,
      "booking": booking,
    };
  }
}
