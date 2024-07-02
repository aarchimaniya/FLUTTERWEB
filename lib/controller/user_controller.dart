import 'package:flutter/material.dart';
import 'dart:io';

import '../modal/webviewmodal.dart';

class UserController extends ChangeNotifier {
  User _user = User(firstName: '', lastName: '', mobileNumber: '');

  User get user => _user;

  void setFirstName(String value) {
    _user.firstName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    _user.lastName = value;
    notifyListeners();
  }

  void setMobileNumber(String value) {
    _user.mobileNumber = value;
    notifyListeners();
  }

  void setImage(File? image) {
    _user.imagePath = image?.path;
    notifyListeners();
  }
}
