import 'package:flutter/material.dart';

class CheckInDietController with ChangeNotifier {
  bool _isKg = true;
  int _selectedIndex = 0;

  bool get isKg => _isKg;
  int get selectedIndex => _selectedIndex;

  List<String> get kgList =>
      List.generate(66, (index) => (0 + index).toString());
  List<String> get libbreList =>
      List.generate(136, (index) => (0 + index).toString());

  List<String> get currentList => _isKg ? kgList : libbreList;

  void toggleUnit() {
    _isKg = !_isKg;
    _selectedIndex = 0;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
