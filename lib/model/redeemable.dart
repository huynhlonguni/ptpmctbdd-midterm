import 'package:flutter/material.dart';
import 'package:midterm_flutter/model/coffee.dart';

class Redeemable {
  final String name;
  final String image;
  final DateTime endTime;
  final int point;
  bool used = false;

  Redeemable({required this.name, required this.image, required this.endTime, required this.point});

  Coffee toCoffee() {
    return Coffee(name: name, image: image, price: {
      "Small": 0,
      "Medium": 0,
      "Large": 0
    });
  }
}

class RedeemableModel extends ChangeNotifier {
  List<Redeemable> redeemList = [
    Redeemable(
      name: "Americano",
      image: "assets/images/Americano.png",
      endTime: DateTime(2025, DateTime.february),
      point: 500,
    ),
    Redeemable(
      name: "Cappuccino",
      image: "assets/images/Cappuccino.png",
      endTime: DateTime(2026, DateTime.february),
      point: 3140,
    ),
    Redeemable(
      name: "Mocha",
      image: "assets/images/Mocha.png",
      endTime: DateTime(2025, DateTime.february),
      point: 200,
    ),
    
  ];

  List<Redeemable> get items => redeemList;

  void useRedeem(int index) {
    redeemList[index].used = true;
    notifyListeners();
  }
}

