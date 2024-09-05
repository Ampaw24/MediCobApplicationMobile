import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';

class DiagnosisService {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child("diagnoses");

  Future<List<Map<String, dynamic>>> fetchDiagnosesBasedOnParameters({
    required double maxPainLevel,
    required String frequency,
    required double temperature,
    required double ppgMax,
    required List<String> emotions,
  }) async {
    try {
      DatabaseEvent event = await _databaseReference.once();

      if (event.snapshot.value != null) {
        // Ensure that the snapshot value is a list
        List<dynamic> diagnosesList = event.snapshot.value as List<dynamic>;

        // Filter the diagnoses
        List<Map<String, dynamic>> filteredDiagnoses = diagnosesList
            .where((diagnosis) => diagnosis is Map) // Ensure each item is a Map
            .map((diagnosis) => Map<String, dynamic>.from(diagnosis as Map))
            .where((diagnosis) {
          Map<String, dynamic> conditions = diagnosis['conditions'];

          // Safely access the conditions map and check the criteria
          bool matchesPainLevel = (conditions['pain_level'] != null &&
              conditions['pain_level']['max'] != null &&
              conditions['pain_level']['max'] <= maxPainLevel);
          bool matchesFrequency = conditions['frequency'] == frequency;
          bool matchesTemperature = conditions['temperature'] != null &&
              conditions['temperature']['min'] <= temperature &&
              conditions['temperature']['max'] >= temperature;
          bool matchesPPG = conditions['ppg_level'] != null &&
              conditions['ppg_level']['max'] <= ppgMax;
          bool matchesEmotion = conditions['emotion'] != null &&
              emotions
                  .any((emotion) => conditions['emotion'].contains(emotion));

          return matchesPainLevel &&
              matchesFrequency &&
              matchesTemperature &&
              matchesPPG &&
              matchesEmotion;
        }).toList();

        log(filteredDiagnoses.toString());
        return filteredDiagnoses;
      } else {
        return [];
      }
    } catch (e) {
      log("Error fetching diagnoses: $e");
      return [];
    }
  }
}
