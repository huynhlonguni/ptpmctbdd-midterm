import 'package:flutter/material.dart';

class Coffee {
  final String name;
  final String image;
  final Map<String, double> price; // Map for sizes and prices

  Coffee({required this.name, required this.image, required this.price});
}


class CoffeeModel extends ChangeNotifier {
  List<Coffee> coffeeList = [
    Coffee(
      name: "Americano",
      image: "assets/images/Americano.png",
      price: {
        "Small": 2.50,
        "Medium": 3.00,
        "Large": 3.50,
      },
    ),
    Coffee(
      name: "Cappuccino",
      image: "assets/images/Cappuccino.png",
      price: {
        "Small": 2.00,
        "Medium": 2.35,
        "Large": 2.80,
      },
    ),
    Coffee(
      name: "Mocha",
      image: "assets/images/Mocha.png",
      price: {
        "Small": 4.00,
        "Medium": 4.50,
        "Large": 5.00,
      },
    ),
    Coffee(
      name: "Flat White",
      image: "assets/images/Flat White.png",
      price: {
        "Small": 8.99,
        "Medium": 9.99,
        "Large": 10.99,
      },
    ),
  ];

  List<Coffee> get coffees => coffeeList;
}

