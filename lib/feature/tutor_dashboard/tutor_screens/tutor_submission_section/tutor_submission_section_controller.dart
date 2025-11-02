import 'package:flutter/material.dart';

class TutorSubmissionSectionController with ChangeNotifier {
  List filterTabs = ['Tutti', 'In attesa di', 'Approvare', 'Respinto'];

  final searchController = TextEditingController();
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  void setSelectedTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  final List<Map<String, dynamic>> allCourses = [
    {
      'title': 'Maria Rossi',
      'modules': "Nozioni di base sulla nutrizione – Modulo 2",
      'students': "Caso di studio • 15 settembre 2025",
      'status': 'Attivo',
    },
    {
      'title': 'John Smith',
      'modules': "Forza e condizionamento – Quiz 1",
      'students': "Quiz • 14 settembre 2025",
      'status': 'In attesa di',
    },
    {
      'title': 'Sarah Lee',
      'modules': "Esame finale – Scienze Motorie",
      'students': "Esame • 10 settembre 2025",
      'status': 'Approvare',
    },
    {
      'title': 'Maria Rossi',
      'modules': "Nozioni di base sulla nutrizione – Modulo 2",
      'students': "Caso di studio • 15 settembre 2025",
      'status': 'Respinto',
    },
    {
      'title': 'John Smith',
      'modules': "Forza e condizionamento – Quiz 1",
      'students': "Quiz • 14 settembre 2025",
      'status': 'Attivo',
    },
    {
      'title': 'Sarah Lee',
      'modules': "Esame finale – Scienze Motorie",
      'students': "Esame • 10 settembre 2025",
      'status': 'Attivo',
    },
  ];

  List<Map<String, dynamic>> get filteredCourses {
    if (_selectedTab == 0) return allCourses;
    final selectedLabel = filterTabs[_selectedTab];
    return allCourses.where((c) => c['status'] == selectedLabel).toList();
  }
}
