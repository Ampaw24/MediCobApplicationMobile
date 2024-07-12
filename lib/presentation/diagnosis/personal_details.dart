import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
import 'package:newmedicob/presentation/diagnosis/symptomsform.dart';
import 'package:newmedicob/presentation/diagnosis/widget/personalwidget_form.dart';

class PersonalFormDiagnosis extends StatefulWidget {
  const PersonalFormDiagnosis({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalFormDiagnosisState createState() => _PersonalFormDiagnosisState();
}

class _PersonalFormDiagnosisState extends State {
  final bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode? heightFocusNode,
      nhisFocusNode,
      nameFocusNode,
      surnameFocusNode,
      genderFocusNode,
      bloodGroupFocusNode,
      weightFocusNode;

  @override
  initState() {
    super.initState();
    nameFocusNode = FocusNode();
    surnameFocusNode = FocusNode();
    heightFocusNode = FocusNode();
    nhisFocusNode = FocusNode();
  }

  @override
  dispose() {
    heightFocusNode!.dispose();
    nameFocusNode!.dispose();
    nhisFocusNode!.dispose();
    weightFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diagnosisProvider = context.read<DiagnosisProvider>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: PersonalFormWidget(
            heightController: diagnosisProvider.heightController,
            weightController: diagnosisProvider.weightController,
            bloodGroupController: diagnosisProvider.bloodTypeController,
            genotypeGroupFocusNode: genderFocusNode,
            heightFocusNode: heightFocusNode,
            nhisFocusNode: nhisFocusNode,
            weightFocusNode: weightFocusNode,
            firstnameFocusNode: nameFocusNode,
            bloodGroupFocusNode: bloodGroupFocusNode,
            genderFocusNode: genderFocusNode,
            firstnameController: diagnosisProvider.fullnameController,
            genderController: diagnosisProvider.genderController,
            genoTypeController: diagnosisProvider.genotypeController,
            nhisController: diagnosisProvider.nhisidController,
            onForgetPassword: () {},
            onRegister: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => SymptomsFormDiagnosis()));
            },
            key: _formKey,
            context: context,
            isLoading: _isLoading),
      ),
    );
  }

  // void _onRegister() async {
  //   if (_formKey.currentState!.validate()) {
  //    Navigator
  //   }
  // }
}
