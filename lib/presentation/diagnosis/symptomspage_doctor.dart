import 'package:flutter/material.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
import 'package:newmedicob/presentation/diagnosis/widget/symptomspage_doctor_widget.dart';

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
          relieveMeasuresController: diagnosisProvider.reliefMeasureController,
          relieveMeasuresFocusNode: relieveMeasuresFocusNode,
            onRegister: () {},
            key: _formKey,
            context: context,
            isLoading: _isLoading),
      ),
    );
  }

  // void _onRegister() async {
  //   if (_formKey.currentState!.validate()) {
  //     if (_passwordController.text != _confirmPasswordController.text) {
  //       toastContainer(
  //         text: "Password and Confirm password fields do not match",
  //         backgroundColor: Colors.red,
  //       );
  //       FocusScope.of(context).requestFocus(weightFocusNode);
  //       return; // Exit the function if passwords do not match
  //     }
  //     setState(() => _isLoading = true);
  //     final map = {
  //       'fname': _firstnameController.text,
  //       'lname': _surnameController.text,
  //       'email': _emailController.text,
  //       'password': _passwordController.text,
  //       'password_confirmation': _confirmPasswordController.text,
  //     };
  //     final result = await httpChecker(
  //       httpRequesting: () => httpRequesting(
  //         useHeader: false,
  //         endPoint: APIServices.register,
  //         method: httpMethod.post,
  //         httpPostBody: map,
  //       ),
  //     );

  //     if (result['ok']) {
  //       pasaUsermodel = PasaUser.fromJson(result['data']);
  //       await saveStringShare(
  //         key: "userDetails",
  //         data: jsonEncode(result['data']),
  //       );
  //       await saveBoolShare(key: "auth", data: true);
  //       toastContainer(
  //         text: "Registration success",
  //         backgroundColor: GREEN,
  //       );
  //       setState(() => _isLoading = false);
  //       navigateAndRemoveRoute(context: context, pageName: LoginPage());
  //     } else {
  //       setState(() => _isLoading = false);
  //       switch (result["statusCode"]) {
  //         case 422:
  //           String errorMessage = "Unknown error";
  //           if (result.containsKey('data') &&
  //               result['data'].containsKey('error_all')) {
  //             List<dynamic> errorAllList = result['data']['error_all'];
  //             errorMessage =
  //                 errorAllList.join(", "); // Join the list into a single string
  //           }
  //           toastContainer(
  //             text: "Validation error: " + errorMessage,
  //             backgroundColor: Colors.red,
  //           );
  //           print(result);
  //           break;
  //         case 500:
  //           toastContainer(
  //             text: "Server error, please try again later",
  //             backgroundColor: Colors.red,
  //           );
  //           break;
  //         case 200:
  //           toastContainer(
  //             text: result["error"],
  //             backgroundColor: Colors.indigo,
  //           );
  //           break;
  //         default:
  //       }
  //     }
  //   }
  // }
}
