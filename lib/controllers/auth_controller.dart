import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoggedIn = false;
  String username = "";

  bool login(String user, String pass) {
    if (user.isNotEmpty && pass.length >= 6) {
      isLoggedIn = true;
      username = user;
      notifyListeners();
      return true;
    }
    return false;
  }
}
