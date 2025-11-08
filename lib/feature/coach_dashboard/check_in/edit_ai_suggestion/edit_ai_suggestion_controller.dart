import 'package:flutter/material.dart';

class EditAiSuggestionController with ChangeNotifier{
  
   final Map<String, dynamic> _aiSuggestions = {
    "nutrition": {
      "status": "Respinto", // or "Approvato", etc.
      "isRejected": true,
      "text": "Nutrizione: Aumentare i carboidrati del 5%",
    },

     "training": {
      "status": "Approvato", // or "Approvato", etc.
      "isRejected": false,
      "text": "Allenamento: aggiungi un giorno di riposo",
    },
  };

  Map<String, dynamic> get aiSuggestions => _aiSuggestions;

  // Update status toggle (on/off)
  void toggleStatus(String key) {
    _aiSuggestions[key]["isRejected"] = !_aiSuggestions[key]["isRejected"];
    _aiSuggestions[key]["status"] =
        _aiSuggestions[key]["isRejected"] ? "Respinto" : "Approvato";
    notifyListeners();
  }

  // Update suggestion text
  void updateText(String key, String newText) {
    _aiSuggestions[key]["text"] = newText;
    notifyListeners();
  }

  // Add new suggestion block
  void addNewSuggestion(String key, Map<String, dynamic> newData) {
    _aiSuggestions[key] = newData;
    notifyListeners();
  }
}