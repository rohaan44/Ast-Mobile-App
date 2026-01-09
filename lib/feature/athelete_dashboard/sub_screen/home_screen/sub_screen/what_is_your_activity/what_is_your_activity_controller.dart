import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class WhatIsYourActivityController with ChangeNotifier {
  Map catType = {
    "type": ["Sedentario", "Super attivo", "Molto attivo", "Poco attivo"],
    "iconImage": [
      AssetUtils.sofaIcon,
      AssetUtils.bicepIcon,
      AssetUtils.weightLifting,
      AssetUtils.walk,
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
      _selectCat = catType["type"]![index];
    }
    notifyListeners();
  }
}
