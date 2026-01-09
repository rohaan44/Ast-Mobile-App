import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class YourPersonalizedPlanController with ChangeNotifier {
  Map catType = {
    "title": ["Calorie", "Proteine", "Carboidrati", "Grassi"],
    "calories": ["2200", "150", "250", "70"],
    "iconImage": [
      AssetUtils.fireIcon,
      AssetUtils.meetSliceIcon,
      AssetUtils.breadIcon,
      AssetUtils.pinAppleIcon,
    ]
  };
  String _selectCat = "";
  String get selectCat => _selectCat;
  set selectCat(String value) {
    _selectCat = value;
    notifyListeners();
  }

  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = null;
    } else {
      _selectedIndex = index;
      selectCat = catType["title"]![index];
    }
    notifyListeners();
  }
}
