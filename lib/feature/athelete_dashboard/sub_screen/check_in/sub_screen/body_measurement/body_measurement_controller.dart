import 'package:flutter/material.dart';

class BodyMeasurementController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController waistCircumferenceController = TextEditingController();
  TextEditingController flanksController = TextEditingController();
  TextEditingController armController = TextEditingController();
  TextEditingController thighsController = TextEditingController();

  BodyMeasurementController() {
    email.addListener(_onTextChanged);
    waistCircumferenceController.addListener(_onTextChanged);
    flanksController.addListener(_onTextChanged);
    armController.addListener(_onTextChanged);
    thighsController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    notifyListeners();
  }

  bool get isNextEnabled =>
      email.text.isNotEmpty &&
      waistCircumferenceController.text.isNotEmpty &&
      armController.text.isNotEmpty &&
      flanksController.text.isNotEmpty &&
      thighsController.text.isNotEmpty;

  @override
  void dispose() {
    email.dispose();
    waistCircumferenceController.dispose();
    flanksController.dispose();
    armController.dispose();
    thighsController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
