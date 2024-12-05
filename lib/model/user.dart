import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String username = "Anderson";
  int loyaltyProgress = 1;
  int loyaltyTotal = 8;
  int points = 2000;
  String phone = "0123465789";
  String email = "user@example.com";
  String address = "Home";

  void updateField(String label, String newValue) {
    switch (label) {
      case 'Full name':
        username = newValue;
        break;
      case 'Phone number':
        phone = newValue;
        break;
      case 'Email':
        email = newValue;
        break;
      case 'Address':
        address = newValue;
        break;
    }
    notifyListeners(); // Notify listeners to update the UI
  }

  void updateUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void getLoyalty(int amount) {
    loyaltyProgress += amount;
    if (loyaltyProgress > loyaltyTotal) {
      loyaltyProgress = loyaltyTotal;
    }
    notifyListeners();
  }

  void redeemLoyalty() {
    loyaltyProgress = 0;
    notifyListeners();
  }

  void getPoint(int points) {
    this.points += points;
    notifyListeners();
  }

  void redeemPoint(int points) {
    if (this.points < points) {
      return;
    }
    this.points -= points;
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
