import 'package:flutter/foundation.dart';

class TabManager extends ChangeNotifier {
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners(); // Notify listeners when the tab changes
  }
}
