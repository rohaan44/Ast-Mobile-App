import 'package:flutter/material.dart';

class TransactionsHistoryController with ChangeNotifier {
  int selectedChoice = 1;
  List<String> choiceList = [
    "Ultimi 7 giorni",
    "Questo lunedì",
    "Crediti",
    "Detrazioni"
  ];

  List<Map<String, dynamic>> transactions = [
    {
      "name": "Max William",
      "title": "Pagamento dell'abbonamento",
      "time": "2 giorni fa",
      "amount": 50.00,
      "status": "completed"
    },
    {
      "name": "Royalty Fee",
      "title": "Tariffa piattaforma",
      "time": "1 giorno fa",
      "amount": -5.00,
      "status": "completed"
    },
    {
      "name": "Max William",
      "title": "Sottoscrizione Pagamento",
      "time": "Oggi",
      "amount": 25.00,
      "status": "pending"
    },
    {
      "name": "Max William",
      "title": "Pagamento dell'abbonamento",
      "time": "Oggi",
      "amount": 25.00,
      "status": "pending"
    },
    {
      "name": "Max William",
      "title": "Pagamento dell'abbonamento",
      "time": "2 giorni fa",
      "amount": -35.00,
      "status": "failed"
    },
  ];

  double get totalCredits =>
      transactions.where((t) => t["amount"] > 0).fold(0.0, (sum, t) => sum + t["amount"]);

  double get totalDeduction =>
      transactions.where((t) => t["amount"] < 0).fold(0.0, (sum, t) => sum + t["amount"].abs());

  void selectChoice(int index) {
    selectedChoice = index;
    notifyListeners();
  }
}
