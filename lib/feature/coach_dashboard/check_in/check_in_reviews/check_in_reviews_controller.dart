import 'package:flutter/material.dart';

class CheckInReviewsController extends ChangeNotifier {
  // 🔹 Filter options
  final List<String> filterOptions = ["Tutto", "In attesa di", "Recensito"];

  // 🔹 Current filter
  String selectedFilter = "Tutto";

  // 🔹 All athletes as Map list
  final List<Map<String, dynamic>> allAthletes = [
    {
      "name": "John Doe",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": false,
      "imagePath": "https://randomuser.me/api/portraits/men/4.jpg",
    },
    {
      "name": "Mitchel Johnson",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": true,
      "imagePath": "https://randomuser.me/api/portraits/men/3.jpg",
    },
    {
      "name": "Max William",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": false,
      "imagePath": "https://randomuser.me/api/portraits/men/2.jpg",
    },
    {
      "name": "David Warner",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": true,
      "imagePath": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Emily Carter",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": false,
      "imagePath": "https://randomuser.me/api/portraits/men/20.jpg",
    },
    {
      "name": "Chris Brown",
      "date": "Sep 20, 2025",
      "weight": 78.5,
      "waist": 82,
      "photos": 3,
      "isReviewed": true,
      "imagePath": "https://randomuser.me/api/portraits/men/8.jpg",
    },
  ];
  List<Map<String, dynamic>> get athletes {
    switch (selectedFilter) {
      case "Recensito":
        return allAthletes.where((a) => a["isReviewed"] == true).toList();
      case "In attesa di":
        return allAthletes.where((a) => a["isReviewed"] == false).toList();
      default:
        return allAthletes;
    }
  }
  void setFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  String _searchQuery = '';
  void filterBySearch(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  List<Map<String, dynamic>> get filteredAthletes {
    final filtered = athletes;
    if (_searchQuery.isEmpty) return filtered;
    return filtered
        .where((a) => (a["name"] as String).toLowerCase().contains(_searchQuery))
        .toList();
  }
}
