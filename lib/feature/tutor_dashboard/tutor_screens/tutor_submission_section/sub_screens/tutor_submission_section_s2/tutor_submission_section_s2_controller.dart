import 'package:flutter/material.dart';

class TutorSubmissionSectionS2Controller with ChangeNotifier {
  String _selectedType = "";
  String get selectedType => _selectedType;

  String? _uploadedFileName;
  String? get uploadedFileName => _uploadedFileName;

  void setSelectedType(String type) {
    _selectedType = type;
    notifyListeners();
  }

  void setUploadedFileName(String fileName) {
    _uploadedFileName = fileName;
    notifyListeners();
  }
}
