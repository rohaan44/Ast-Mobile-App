import 'package:flutter/foundation.dart';

class PaymentsRoyaltiesController extends ChangeNotifier {
  // Earnings summary
  double totalEarnings = 2450.00;
  double bonus = 650.00;
  String currency = "USD";
  String lastPayoutDate = "Sept 15, 2025";
  double royaltyPercent = 70;

  // Transactions
  List<Map<String, dynamic>> transactions = [
    {
      "title": "Pagamento",
      "subtitle": "A: Conto Bancario",
      "amount": -2450.00,
      "status": "Completato",
    },
    {
      "title": "Abbonamento Pagamento",
      "subtitle": "Da: Jane Smith",
      "amount": 50.00,
      "status": "Completato",
    },
    {
      "title": "Abbonamento Pagamento",
      "subtitle": "Da: Alex Chen",
      "amount": 250.00,
      "status": "Fino a",
    },
    {
      "title": "Rimborso",
      "subtitle": "A: Sam Wilson",
      "amount": -20.00,
      "status": "Fallito",
    },
  ];

  // Subscriptions
  List<Map<String, dynamic>> subscriptions = [
    {
      "name": "John Doe",
      "type": "Piano Mensile",
      "status": "Attivo",
      "amount": 50,
    },
    {
      "name": "Max William",
      "type": "Piano Trimestrale",
      "status": "In pausa",
      "amount": 50,
    },
    {
      "name": "Emily Carter",
      "type": "Piano Mensile",
      "status": "Annullata",
      "amount": 50,
    },
    {
      "name": "David Lark",
      "type": "Piano Mensile",
      "status": "Attiva",
      "amount": 50,
    },
  ];

  // Update earning chart data (for future dynamic charts)
  List<double> chartData = [6, 5, 7, 9, 10, 8, 12];

  void addTransaction(Map<String, dynamic> newTx) {
    transactions.insert(0, newTx);
    notifyListeners();
  }

  void updateRoyaltyPercent(double percent) {
    royaltyPercent = percent;
    notifyListeners();
  }
}
