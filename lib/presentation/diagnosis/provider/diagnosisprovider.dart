import 'package:flutter/material.dart';

class DiagnosisProvider extends ChangeNotifier {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController nhisidController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController genotypeController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
}
