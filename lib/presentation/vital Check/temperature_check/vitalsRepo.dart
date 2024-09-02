class ConditionRange {
  final double min;
  final double max;

  ConditionRange({required this.min, required this.max});

  bool isWithinRange(double value) {
    return value >= min && value <= max;
  }

  factory ConditionRange.fromJson(Map<String, dynamic> json) {
    return ConditionRange(
      min: json['min'].toDouble(),
      max: json['max'].toDouble(),
    );
  }
}

class Conditions {
  final ConditionRange temperature;
  final ConditionRange ppgLevel;
  final List<String> emotion;
  final ConditionRange bmi;
  final String frequency;
  final ConditionRange painLevel;

  Conditions({
    required this.temperature,
    required this.ppgLevel,
    required this.emotion,
    required this.bmi,
    required this.frequency,
    required this.painLevel,
  });

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
      temperature: ConditionRange.fromJson(json['temperature']),
      ppgLevel: ConditionRange.fromJson(json['ppg_level']),
      emotion: List<String>.from(json['emotion']),
      bmi: ConditionRange.fromJson(json['bmi']),
      frequency: json['frequency'],
      painLevel: ConditionRange.fromJson(json['pain_level']),
    );
  }
}

class Diagnosis {
  final String name;
  final Conditions conditions;
  final String recommendation;

  Diagnosis({
    required this.name,
    required this.conditions,
    required this.recommendation,
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      name: json['name'],
      conditions: Conditions.fromJson(json['conditions']),
      recommendation: json['recommendation'],
    );
  }
}

class DiagnosisService {
  final List<Diagnosis> diagnoses;

  DiagnosisService({required this.diagnoses});

  factory DiagnosisService.fromJson(List<dynamic> json) {
    return DiagnosisService(
      diagnoses: json.map((item) => Diagnosis.fromJson(item)).toList(),
    );
  }

  List<Diagnosis> getDiagnosis({
    required double temperature,
    required double ppgValue,
    required double bmi,
    required List<String> emotions,
  }) {
    return diagnoses.where((diagnosis) {
      final conditions = diagnosis.conditions;
      return conditions.temperature.isWithinRange(temperature) &&
          conditions.ppgLevel.isWithinRange(ppgValue) &&
          conditions.bmi.isWithinRange(bmi) &&
          emotions.any((emotion) => conditions.emotion.contains(emotion));
    }).toList();
  }
}

void main() {
  // Example JSON data
  final jsonData = [
    {
      "name": "Chronic Fatigue Syndrome",
      "conditions": {
        "temperature": {"min": 97, "max": 99},
        "ppg_level": {"min": 60, "max": 100},
        "emotion": ["extreme fatigue", "muscle pain"],
        "bmi": {"min": 18.5, "max": 24.9},
        "frequency": "high",
        "pain_level": {"min": 2, "max": 6}
      },
      "recommendation":
          "Rest regularly, manage stress, and consult with a healthcare provider."
    },
    {
      "name": "Gout",
      "conditions": {
        "temperature": {"min": 97, "max": 99},
        "ppg_level": {"min": 60, "max": 90},
        "emotion": ["pain", "discomfort"],
        "bmi": {"min": 25, "max": 35},
        "frequency": "moderate",
        "pain_level": {"min": 6, "max": 10}
      },
      "recommendation":
          "Limit purine-rich foods, stay hydrated, and take prescribed medication."
    },
  ];

  final diagnosisService = DiagnosisService.fromJson(jsonData);

  final results = diagnosisService.getDiagnosis(
    temperature: 98,
    ppgValue: 85,
    bmi: 24,
    emotions: ['muscle pain', 'pain'],
  );

  for (var diagnosis in results) {
    print('Diagnosis: ${diagnosis.name}');
    print('Recommendation: ${diagnosis.recommendation}\n');
  }
}
