// lib/models/user.dart
class User {
  String firstName;
  String lastName;
  String mobileNumber;
  String? imagePath;

  User({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    this.imagePath,
  });
}
