import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class TrainingDetailController extends ChangeNotifier {
  int isSelected = 0;
  final List myItems = [
    {'text': '12 kcal', 'img': AssetUtils.fireIcon},
    {'text': '4 • Allenamento', 'img': AssetUtils.redDumble},
    {
      'text': '3.5 • Valutazioni',
      "img": AssetUtils.goldenStar,
    },
    {'text': '3 serie x 20 sec', 'img': AssetUtils.fireIcon},
    {'text': '1 - 2 • RIR'},
  ];
  List categories = [
    {"label": "Settimana 1"},
    {"label": "Settimana 2"},
    {"label": "Settimana 3"},
    {"label": "Settimana 4"},
  ];

  List calList = [
    {"label": "12 kcal", "color": AppColor.primary.withOpacity(0.2)},
    {"label": "3 serie × 30 sec", "color": AppColor.c34C759},
    {"label": "1 min al giorno", "color": AppColor.c00C3D0},
    {"label": "7 giorni", "color": AppColor.cFFCC00},
  ];

  int selectedCategoryIndex = 0;

  void setSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners(); // or model.notify() if you're using your base viewmodel
  }

  List nextMealList = [
    {
      "img": AssetUtils.posture1,
      "title": "Forma e stabilità del core",
      "time": "00:30 sec",
      "cals": "6 kcal",
    },
    {
      "img": AssetUtils.posture2,
      "title": "Forma e stabilità del core 2",
      "time": "00:30 00:30 sec",
      "cals": "6 kcal",
    },
  ];

  List principalList = [
    "Principiante: ritmo lento, mani rialzate",
    "Intermedio: ritmo standard a terra",
    "Avanzato: climbers incrociati o con dischi scorrevoli"
  ];
}
