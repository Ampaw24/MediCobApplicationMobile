import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
import 'package:newmedicob/presentation/diagnosis/symptomspage_doctor.dart';
import 'package:newmedicob/presentation/diagnosis/widget/symptoms_widget.dart';

class SymptomsFormDiagnosis extends StatefulWidget {
  const SymptomsFormDiagnosis({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SymptomsFormDiagnosisState createState() => _SymptomsFormDiagnosisState();
}

class _SymptomsFormDiagnosisState extends State {
  final bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode? symptomTypeFocusNode,
      levelFocusNode,
      durationFocusNode,
      frequencyFocusNode,
      triggerFocusNode,
      notesFocusNode;

  @override
  void initState() {
    super.initState();
    symptomTypeFocusNode = FocusNode();
    durationFocusNode = FocusNode();
    frequencyFocusNode = FocusNode();
    triggerFocusNode = FocusNode();
    notesFocusNode = FocusNode();
  }

  @override
  void dispose() {
    symptomTypeFocusNode!.dispose();
    durationFocusNode!.dispose();
    frequencyFocusNode!.dispose();
    triggerFocusNode!.dispose();
    notesFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = context.read<DiagnosisProvider>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: WHITE,
        body: SymptomFormWidget(
            onForgetPassword: () {},
            durationController: diagnosisProvider.durationController,
            durationFocusNode: durationFocusNode,
            frequencyController: diagnosisProvider.frequencyController,
            frequencyFocusNode: frequencyFocusNode,
            levelController: diagnosisProvider.levelController,
            levelFocusNode: levelFocusNode,
            notesController: diagnosisProvider.notesController,
            notesFocusNode: notesFocusNode,
            onRegister: _onRegister,
            symptomTypeController: diagnosisProvider.symptomTypeController,
            symptomsFocusNode: symptomTypeFocusNode,
            triggerController: diagnosisProvider.triggerController,
            triggerFocusNode: triggerFocusNode,
            key: _formKey,
            context: context,
            isLoading: _isLoading),
      ),
    );
  }
  void _onRegister() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,CupertinoPageRoute(builder: (context) => SymptomsFormDiagnosisDoctor()));
    }
  }
}
