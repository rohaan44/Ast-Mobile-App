import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class TrainingViewController with ChangeNotifier {
  int selectedCategoryIndex = 0;

  void setSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  final List categories = [
    "Tutti",
    "Cardio",
    "Squat",
    "Stretching",
    "News",
    "Movies",
    "Tech",
    "Sports",
  ];

  final List workoutPlans = [
    {
      "title": "Mountain Climbers",
      "subTitle": "Attivazione del core +\ncardio",
      "difficultyLevel": "Principiante",
      "img": AssetUtils.card1,
      "date": "4 settimane"
    },
    {
      "title": "Stacchi",
      "subTitle": "Convenzionale, Rumeno,\nSumo",
      "difficultyLevel": "Intermedio",
      "img": AssetUtils.card2,
      "date": "5 settimane"
    },
    {
      "title": "Rematori",
      "subTitle": "Bilanciere, Manubrio,\nCavo",
      "difficultyLevel": "Intermedio",
      "img": AssetUtils.card3,
      "date": "4 settimane"
    },
    {
      "title": "Panca Piana",
      "subTitle": "Piana, Inclinata, Manubri",
      "difficultyLevel": "Principiante",
      "img": AssetUtils.card4,
      "date": "2 settimane"
    },
    {
      "title": "Stacchi",
      "subTitle": "Convenzionale, Rumeno,\nSumo",
      "difficultyLevel": "Intermedio",
      "img": AssetUtils.card2,
      "date": "4 settimane"
    },
    {
      "title": "Rematori",
      "subTitle": "Bilanciere, Manubrio,\nCavo",
      "difficultyLevel": "Intermedio",
      "img": AssetUtils.card3,
      "date": "2 settimane"
    },
  ];
}
