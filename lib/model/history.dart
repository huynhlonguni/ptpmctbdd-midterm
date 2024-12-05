import 'package:flutter/material.dart';
import 'order.dart';

class HistoryModel extends ChangeNotifier {
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

  void setItemStatus(int index, bool isCompleted) {
    Order item = _items[index];
    items[index] = item.copyWith(isCompleted: isCompleted);
    notifyListeners();
  }
}
