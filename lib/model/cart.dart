import 'package:flutter/material.dart';
import 'order.dart';

class CartModel extends ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items => _items;

  void addItem(Order item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
