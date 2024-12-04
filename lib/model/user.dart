import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String username = "Anderson";
  int loyaltyProgress = 4;
  int loyaltyTotal = 8;

  void updateUsername(String name) {
    username = name;
    notifyListeners();
  }

  void updateLoyaltyProgress(int progress) {
    loyaltyProgress = progress;
    notifyListeners();
  }
}
