import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  final TextEditingController endtimeController = TextEditingController();
  final TextEditingController starttimeController = TextEditingController();
  var selectedStartTime = TimeOfDay.now();
  var selectedEndTime = TimeOfDay.now();

  void pickStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );
    if (picked != null && picked != selectedStartTime) {
      selectedStartTime = picked;
      starttimeController.text = picked.format(context);
    }
  }

  void pickEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );
    if (picked != null && picked != selectedEndTime) {
      selectedEndTime = picked;
      endtimeController.text = picked.format(context);
    }
  }
   textFieldValidation(String value) {
    if (value.isEmpty) {
      return "Fill the field";
    } else {
      return null;
    }
  }
}
