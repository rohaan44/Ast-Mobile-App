import 'package:flutter/foundation.dart';

class DinnerTimeController extends ChangeNotifier {
  DinnerTimeController() {
    // Default: 07:00 PM
    _selectedHour = hours[7];
    _selectedMinute = minutes[0];
    _period = 'PM';
  }

  /// List of hours 01–12
  final List<String> hours =
      List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));

  /// List of minutes 00–59
  final List<String> minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));

  /// Period list (AM/PM)
  final List<String> periods = ['AM', 'PM'];

  // --- SELECTED VALUES ---
  late String _selectedHour;
  late String _selectedMinute;
  late String _period;

  // --- GETTERS ---
  String get selectedHour => _selectedHour;
  String get selectedMinute => _selectedMinute;
  String get period => _period;
  String get fullTime => "$_selectedHour:$_selectedMinute $_period";

  // --- SETTERS ---
  void setSelectedHour(int index) {
    _selectedHour = hours[index];
    notifyListeners();
  }

  void setSelectedMinute(int index) {
    _selectedMinute = minutes[index];
    notifyListeners();
  }

  void setPeriod(String value) {
    _period = value;
    notifyListeners();
  }
}
