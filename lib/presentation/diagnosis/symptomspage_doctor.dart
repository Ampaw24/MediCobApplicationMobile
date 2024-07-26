import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
import 'package:newmedicob/presentation/diagnosis/widget/symptomspage_doctor_widget.dart';
import 'package:newmedicob/presentation/vital%20Check/vitalchecker_home.dart';

class SymptomsFormDiagnosisDoctor extends StatefulWidget {
  const SymptomsFormDiagnosisDoctor({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SymptomsFormDiagnosisState createState() => _SymptomsFormDiagnosisState();
}

class _SymptomsFormDiagnosisState extends State {
  final bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode? relieveMeasuresFocusNode,
      locationFocusNode,
      moodOrEmotionsFocusNode,
      notesFocusNode;

  @override
  void initState() {
    super.initState();
    relieveMeasuresFocusNode = FocusNode();
    locationFocusNode = FocusNode();
    moodOrEmotionsFocusNode = FocusNode();
    locationFocusNode = FocusNode();
    notesFocusNode = FocusNode();
  }

  @override
  void dispose() {
    relieveMeasuresFocusNode!.dispose();
    locationFocusNode!.dispose();
    moodOrEmotionsFocusNode!.dispose();
    locationFocusNode!.dispose();
    notesFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = context.read<DiagnosisProvider>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SymptomDetailsDoctor(
            locationController: diagnosisProvider.locationController,
            locationFocusNode: locationFocusNode,
            moodOrEmotionsController: diagnosisProvider.moodOrEmotionController,
            moodOrEmotionsFocusNode: moodOrEmotionsFocusNode,
            relieveMeasuresController:
                diagnosisProvider.reliefMeasureController,
            relieveMeasuresFocusNode: relieveMeasuresFocusNode,
            onRegister: () {
              Get.to(() => VitalSignsPage(),
                  transition: Transition.cupertinoDialog);
            },
            key: _formKey,
            context: context,
            isLoading: _isLoading),
      ),
    );
  }
}
