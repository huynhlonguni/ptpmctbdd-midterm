import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String username = "Anderson";
  int loyaltyProgress = 4;
  int loyaltyTotal = 8;
  String phone = "0123465789";
  String email = "user@example.com";
  String address = "Home";

  void updateUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void updatePhone(String phone) {
    this.phone = phone;
    notifyListeners();
  }

  void updateEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void updateAddress(String address) {
    this.address = address;
    notifyListeners();
  }

  void updateLoyaltyProgress(int progress) {
    loyaltyProgress = progress;
    notifyListeners();
  }
}
