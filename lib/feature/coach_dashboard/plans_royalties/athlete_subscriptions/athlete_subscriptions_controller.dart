import 'package:flutter/material.dart';

class AthleteSubscriptionsController with ChangeNotifier {
  int selectedChoice = 1;
  List<String> choiceList = [
    "Ultimi 7 giorni",
    "Questo lunedì",
    "Crediti",
    "Detrazioni"
  ];

  List<Map<String, dynamic>> subscriptions = [
    {
      "name": "Max William",
      "plan": "Piano personalizzato",
      "status": "Attiva",
      "billingDate": "Sep 25",
      "amount": 250.0,
    },
    {
      "name": "John Doe",
      "plan": "Piano personalizzato",
      "status": "Attiva",
      "billingDate": "Sep 25",
      "amount": 250.0,
    },
    {
      "name": "Emily Carter",
      "plan": "Piano personalizzato",
      "status": "Attiva",
      "billingDate": "Sep 25",
      "amount": 250.0,
    },
    {
      "name": "David Lark",
      "plan": "Piano personalizzato",
      "status": "Attiva",
      "billingDate": "Sep 25",
      "amount": 250.0,
    },
    {
      "name": "Sarah Lee",
      "plan": "Piano personalizzato",
      "status": "Attiva",
      "billingDate": "Sep 25",
      "amount": 250.0,
    },
  ];

  List<Map<String, dynamic>> filteredSubscriptions = [];

  AthleteSubscriptionsController() {
    filteredSubscriptions = List.from(subscriptions);
  }

  void selectChoice(int index) {
    selectedChoice = index;
    notifyListeners();
  }

  void filterAthletes(String query) {
    if (query.isEmpty) {
      filteredSubscriptions = List.from(subscriptions);
    } else {
      filteredSubscriptions = subscriptions
          .where((a) =>
              a["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  int get activeCount =>
      subscriptions.where((a) => a["status"] == "Attiva").length;

  double get totalRevenue =>
      subscriptions.fold(0.0, (sum, a) => sum + a["amount"]);
}
