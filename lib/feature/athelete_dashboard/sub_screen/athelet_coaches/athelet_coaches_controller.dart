import 'package:flutter/material.dart';

class AtheletCoachesController extends ChangeNotifier {
  int selectedCategoryIndex = 0;

  void setSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners(); // or model.notify() if you're using your base viewmodel
  }

  final List categories = [
    "Tutti",
    "Cardio",
    "Squat",
    "Stretching",
    "News",
    "Movies",
    "Tech",
    "Sports",
  ];

  final List atheletCoaches = [
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Dianne Russell",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "title": "Robert Fox",
      "subTitle": "Flessibilità • Anaerobico"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "title": "Jane Cooper",
      "subTitle": "Equilibrio • Forza",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Darleen Bratt",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Dianne Russell",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "title": "Robert Fox",
      "subTitle": "Flessibilità • Anaerobico"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "title": "Jane Cooper",
      "subTitle": "Equilibrio • Forza",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Darleen Bratt",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Dianne Russell",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShWl94Jfz89ZJmM0Y3uj0sB2hScWJsAWIrTw&s",
      "title": "Robert Fox",
      "subTitle": "Flessibilità • Anaerobico"
    },
    {
      "img":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
      "title": "Jane Cooper",
      "subTitle": "Equilibrio • Forza",
    },
    {
      "img":
          "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
      "title": "Darleen Bratt",
      "subTitle": "Forza • Cardio • Equilibrio"
    },
  ];
}
