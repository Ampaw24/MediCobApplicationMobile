import 'package:firebase_database/firebase_database.dart';

class DiagnosisService {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child("diagnoses");

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
        List<dynamic> diagnosesList = event.snapshot.value as List<dynamic>;

        List<Map<String, dynamic>> filteredDiagnoses = diagnosesList
            .map((diagnosis) => Map<String, dynamic>.from(diagnosis))
            .where((diagnosis) {
              Map<String, dynamic> conditions = diagnosis['conditions'];
              
              // Check conditions
              bool matchesPainLevel = conditions['pain_level']['max'] <= maxPainLevel;
              bool matchesFrequency = conditions['frequency'] == frequency;
              bool matchesTemperature = conditions['temperature']['min'] <= temperature && conditions['temperature']['max'] >= temperature;
              bool matchesPPG = conditions['ppg_level']['max'] <= ppgMax;
              bool matchesEmotion = emotions.any((emotion) => conditions['emotion'].contains(emotion));
              
              return matchesPainLevel && matchesFrequency && matchesTemperature && matchesPPG && matchesEmotion;
            })
            .toList();

        return filteredDiagnoses;
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching diagnoses: $e");
      return [];
    }
  }
}
