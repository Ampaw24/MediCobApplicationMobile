import 'package:flutter/material.dart';

class DiagnosisProvider extends ChangeNotifier {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController nhisidController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController genotypeController = TextEditingController();
  final TextEditingController bloodTypeController = TextEditingController();
  final TextEditingController symptomTypeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController triggerController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController reliefMeasureController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController moodOrEmotionController = TextEditingController();
  final TextEditingController doctorsNoteController = TextEditingController();
  final TextEditingController levelController = TextEditingController();

  // Dispose controllers when not needed
  @override
  void dispose() {
    fullnameController.dispose();
    nhisidController.dispose();
    heightController.dispose();
    weightController.dispose();
    genderController.dispose();
    genotypeController.dispose();
    bloodTypeController.dispose();
    symptomTypeController.dispose();
    durationController.dispose();
    frequencyController.dispose();
    triggerController.dispose();
    notesController.dispose();
    reliefMeasureController.dispose();
    locationController.dispose();
    moodOrEmotionController.dispose();
    doctorsNoteController.dispose();
    super.dispose();
  }
}
