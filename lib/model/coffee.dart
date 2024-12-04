import 'package:flutter/material.dart';

class Coffee {
  final String name;
  final String image;

  Coffee({required this.name, required this.image});
}

class CoffeeModel extends ChangeNotifier {
  List<Coffee> coffeeList = [
    Coffee(name: "Americano", image: "assets/images/Americano.png"),
    Coffee(name: "Cappuccino", image: "assets/images/Cappuccino.png"),
    Coffee(name: "Mocha", image: "assets/images/Mocha.png"),
    Coffee(name: "Flat White", image: "assets/images/Flat White.png"),
    Coffee(name: "Americano", image: "assets/images/Americano.png"),
    Coffee(name: "Cappuccino", image: "assets/images/Cappuccino.png"),
    Coffee(name: "Mocha", image: "assets/images/Mocha.png"),
    Coffee(name: "Flat White", image: "assets/images/Flat White.png"),
  ];

  List<Coffee> get coffees => coffeeList;
}
