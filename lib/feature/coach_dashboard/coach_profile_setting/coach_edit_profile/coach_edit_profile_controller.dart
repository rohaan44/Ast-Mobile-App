import 'dart:io';

import 'package:flutter/material.dart';

class CoachEditProfileController with ChangeNotifier {
   File? _profileImage;

  File? get profileImage => _profileImage;

   void deleteProfileImage() {
    _profileImage = null;
    notifyListeners();
  }
}