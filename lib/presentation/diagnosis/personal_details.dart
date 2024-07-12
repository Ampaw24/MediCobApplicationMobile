import 'package:flutter/material.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/presentation/diagnosis/provider/diagnosisprovider.dart';
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

  FocusNode? _emailFocusNode,
      _passwordFocusNode,
      firstnameFocusNode,
      surnameFocusNode,
      _confirmPasswordFocusNode;

  @override
  initState() {
    super.initState();
    firstnameFocusNode = FocusNode();
    surnameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  dispose() {
    _emailFocusNode!.dispose();
    firstnameFocusNode!.dispose();
    _passwordFocusNode!.dispose();
    _confirmPasswordFocusNode!.dispose();
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
            weightController: diagnosisProvider.heightController,
            bloodGroupController: diagnosisProvider.bloodTypeController,
            firstnameFocusNode: firstnameFocusNode,
            firstnameController: diagnosisProvider.fullnameController,
            genderController: diagnosisProvider.genderController,
            genoTypeController: diagnosisProvider.genotypeController,
            nhisController: diagnosisProvider.nhisidController,
            onForgetPassword: () {},
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
  //       FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
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
