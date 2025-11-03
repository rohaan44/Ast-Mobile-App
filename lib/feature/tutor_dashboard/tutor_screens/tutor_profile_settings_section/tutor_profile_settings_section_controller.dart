import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class TutorProfileSettingsSectionController with ChangeNotifier {
  File? _profileImage;

  File? get profileImage => _profileImage;

  /// Pick image using file_picker
  Future<void> pickProfileImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        _profileImage = File(result.files.single.path!);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  /// Delete current image
  void deleteProfileImage() {
    _profileImage = null;
    notifyListeners();
  }
}
