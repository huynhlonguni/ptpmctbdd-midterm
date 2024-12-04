import 'package:flutter/material.dart';

class Coffee {
  final String name;
  final String image;
  final double price;

  Coffee({required this.name, required this.image, required this.price});
}

class CoffeeModel extends ChangeNotifier {
  List<Coffee> coffeeList = [
    Coffee(name: "Americano", image: "assets/images/Americano.png", price: 3.00),
    Coffee(name: "Cappuccino", image: "assets/images/Cappuccino.png", price: 2.35),
    Coffee(name: "Mocha", image: "assets/images/Mocha.png", price: 4.50),
    Coffee(name: "Flat White", image: "assets/images/Flat White.png", price: 9.99),
  ];

  List<Coffee> get coffees => coffeeList;
}
