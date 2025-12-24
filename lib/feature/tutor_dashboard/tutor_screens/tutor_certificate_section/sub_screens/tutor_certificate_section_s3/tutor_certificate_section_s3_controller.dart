import 'package:flutter/material.dart';

class TutorCertificateSectionS3Controller with ChangeNotifier {
  List filterTabs = ['Scadenza tra 30 giorni', 'Scade tra 7 giorni', 'Scaduta'];
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  void setSelectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  final List<Map<String, String>> students = [
    {
      "initials": "JD",
      "name": "John Doe",
      "due": "In scadenza a breve",
      "course": "Allenamento di forza avanzato",
      "certificateExpiry": "15 ottobre 2025",
      "status": "Rinnovare"
    },
    {
      "initials": "MS",
      "name": "Maria Smith",
      "due": "In scadenza a breve",
      "course": "Allenamento di resistenza",
      "certificateExpiry": "20 ottobre 2025",
      "status": "Rinnovare"
    },
    {
      "initials": "LB",
      "name": "Luca Bianchi",
      "due": "In scadenza a breve",
      "course": "Yoga avanzato",
      "certificateExpiry": "10 ottobre 2025",
      "status": "Rinnovare"
    },
  ];
}
