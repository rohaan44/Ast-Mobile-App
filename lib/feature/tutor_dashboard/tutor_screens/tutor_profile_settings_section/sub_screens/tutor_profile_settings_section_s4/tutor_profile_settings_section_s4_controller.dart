import 'package:flutter/material.dart';

class TutorProfileSettingsSectionS4Controller with ChangeNotifier {
  /// Available language options
  final List<String> languages = [
    "English (US)",
    "Italiano",
    "Español",
    "Deutsch",
    "Français",
    "العربية (Arabic)",
    "हिन्दी (Hindi)",
  ];

  /// Currently selected language
  String selectedLanguage = "Italiano";

  /// Save or update the selected language
  void saveSelectedLanguage(String lang) {
    selectedLanguage = lang;
    notifyListeners();
    // Optional: Save to SharedPreferences or backend API later
  }
}
