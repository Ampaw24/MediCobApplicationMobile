import 'package:flutter/material.dart';

class VitalCheckProvider extends ChangeNotifier {
  double temperature_value = 0;
  double bmi_value = 0;
  double ppg_value = 0;
  //update temperature function
  void updateTemperature(double updated_temperature) {
    temperature_value = updated_temperature;
    notifyListeners();
  }

  void updateBmi(double updated_bmi) {
    bmi_value = updated_bmi;
    notifyListeners();
  }
    void updatePPG(double updated_ppg) {
    ppg_value = updated_ppg;
    notifyListeners();
  }
}
