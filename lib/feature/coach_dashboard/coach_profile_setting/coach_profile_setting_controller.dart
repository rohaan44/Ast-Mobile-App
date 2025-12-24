import 'dart:io';
import 'package:flutter/material.dart';

class CoachProfileSettingController with ChangeNotifier {
  File? _profileImage;

  File? get profileImage => _profileImage;
bool _isNotification = true;

bool get isNotification => _isNotification;

set isNotification(bool value) {
  _isNotification = value;
  notifyListeners();
}

  /// Pick image using file_picker
  // Future<void> pickProfileImage() async {
  //   try {
  //     final result = await FilePicker.platform.pickFiles(
  //       type: FileType.image,
  //       allowMultiple: false,
  //     );

  //     if (result != null && result.files.single.path != null) {
  //       _profileImage = File(result.files.single.path!);
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     debugPrint("Error picking image: $e");
  //   }
  // }

  /// Delete current image
  void deleteProfileImage() {
    _profileImage = null;
    notifyListeners();
  }
}
