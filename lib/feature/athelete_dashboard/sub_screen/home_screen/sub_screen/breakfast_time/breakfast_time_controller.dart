import 'package:flutter/foundation.dart';

class BreakFastTimeController extends ChangeNotifier {
  BreakFastTimeController() {
    // Default: 07:00
    _selectedHour = hours[7];
    _selectedMinute = minutes[0];
  }

  // --- DATA LISTS ---

  /// List of hours 00–23
  final List<String> hours =
      List.generate(24, (index) => index.toString().padLeft(2, '0'));

  /// List of minutes 00–59
  final List<String> minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));

  // --- SELECTED VALUES ---
  late String _selectedHour;
  late String _selectedMinute;

  // --- GETTERS ---
  String get selectedHour => _selectedHour;
  String get selectedMinute => _selectedMinute;
  String get fullTime => "$_selectedHour:$_selectedMinute";

  // --- SETTERS ---
  void setSelectedHour(int index) {
    _selectedHour = hours[index];
    notifyListeners();
  }

  void setSelectedMinute(int index) {
    _selectedMinute = minutes[index];
    notifyListeners();
  }
}
