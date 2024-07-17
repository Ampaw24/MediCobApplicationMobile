import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/custom_text_form_field.dart';
import 'package:newmedicob/core/network/firebase_provider.dart';
import 'package:newmedicob/core/spec/toastcontainer.dart';
import 'package:newmedicob/core/textstyles.dart';
import 'package:newmedicob/presentation/Authentication/login/login.dart';

class CRegisterPage extends StatefulWidget {
  final Map<String, dynamic> userMap;

  const CRegisterPage({super.key, required this.userMap});
  @override
  _CRegisterPageState createState() => _CRegisterPageState();
}

class _CRegisterPageState extends State<CRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _medicalConditionController =
      TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  FocusNode? _heightFocusNode,
      _weightFocusNode,
      _dobFocusNode,
      _medicalConditionFocusNode,
      _genderFocusNode;
  double _fitnessLevel = 0.0;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _dobFocusNode = FocusNode();
    _heightFocusNode = FocusNode();
    _weightFocusNode = FocusNode();
    _medicalConditionFocusNode = FocusNode();
    _genderFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _dobFocusNode?.dispose();
    _heightFocusNode?.dispose();
    _weightFocusNode?.dispose();
    _medicalConditionFocusNode?.dispose();
    _genderFocusNode?.dispose();
    super.dispose();
  }

  void _toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> genderOptions = ['Male', 'Female', 'Other'];
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),
                    Center(
                      child: Image.asset(
                        'assets/images/registerhealth.png', // Update this with your actual image path
                        height: 150,
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Personal Details",
                        style: headerText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Register Patients Details",
                        style: subheaderText,
                      ),
                    ),
                    const Gap(5),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 7),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Date of Birth",
                                style: subheaderText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    _dobController.text =
                                        "${pickedDate.toLocal()}".split(' ')[0];
                                  });
                                }
                              },
                              child: AbsorbPointer(
                                child: CustomTextFormField(
                                  prefix: Icon(Iconsax.calendar),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  autofocus: false,
                                  hintText: "Date of Birth",
                                  controller: _dobController,
                                  focusNode: _dobFocusNode,
                                  fillColor: WHITE,
                                  hintStyle: subheaderText,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 7),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Height",
                                          style: subheaderText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: CustomTextFormField(
                                        autofocus: false,
                                        hintText: "Height",
                                        controller: _heightController,
                                        focusNode: _heightFocusNode,
                                        fillColor: WHITE,
                                        hintStyle: subheaderText,
                                        suffix: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Iconsax.minus),
                                              onPressed: () {
                                                int currentValue = int.tryParse(
                                                        _heightController
                                                            .text) ??
                                                    0;
                                                if (currentValue > 0) {
                                                  setState(() {
                                                    _heightController.text =
                                                        (currentValue - 1)
                                                            .toString();
                                                  });
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Iconsax.add),
                                              onPressed: () {
                                                int currentValue = int.tryParse(
                                                        _heightController
                                                            .text) ??
                                                    0;
                                                setState(() {
                                                  _heightController.text =
                                                      (currentValue + 1)
                                                          .toString();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25, vertical: 7),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Weight",
                                          style: subheaderText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: CustomTextFormField(
                                        autofocus: false,
                                        hintText: "Weight",
                                        controller: _weightController,
                                        focusNode: _weightFocusNode,
                                        fillColor: WHITE,
                                        hintStyle: subheaderText,
                                        suffix: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Iconsax.minus),
                                              onPressed: () {
                                                int currentValue = int.tryParse(
                                                        _weightController
                                                            .text) ??
                                                    0;
                                                if (currentValue > 0) {
                                                  setState(() {
                                                    _weightController.text =
                                                        (currentValue - 1)
                                                            .toString();
                                                  });
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Iconsax.add),
                                              onPressed: () {
                                                int currentValue = int.tryParse(
                                                        _weightController
                                                            .text) ??
                                                    0;
                                                setState(() {
                                                  _weightController.text =
                                                      (currentValue + 1)
                                                          .toString();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Fitness Level",
                                    style: subheaderText,
                                  ),
                                ),
                              ),
                              Slider(
                                value: _fitnessLevel,
                                min: 0,
                                max: 10,
                                divisions: 10,
                                activeColor: PRIMARYCOLOR,
                                inactiveColor: PRIMARYLIGHT,
                                label: _fitnessLevel.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _fitnessLevel = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Medical Condition",
                                style: subheaderText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: CustomTextFormField(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              controller: _medicalConditionController,
                              fillColor: WHITE,
                              validate: false,
                              autofocus: false,
                              hintText: "Medical condition (optional)",
                              focusNode: _medicalConditionFocusNode,
                              hintStyle: subheaderText,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 7),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Gender",
                                style: subheaderText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                filled: true,
                                fillColor: WHITE,
                                hintStyle: subheaderText,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: Text(
                                'Choose Gender',
                                style: subheaderText,
                              ),
                              value: _genderController.text.isNotEmpty == true
                                  ? _genderController.text
                                  : null,
                              onChanged: (String? newValue) {
                                _genderController.text = newValue!;
                              },
                              items: genderOptions
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ButtonTheme(
                                minWidth: 500,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: button(
                                    buttonRadius: 10,
                                    height: 55,
                                    onPressed: _onRegister,
                                    text: "Register",
                                    color: Colors.transparent,
                                    context: context,
                                    showLoadingIndicator: isLoading,
                                    useGradient: true),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
       
      ],
    );
  }

  void _onRegister() async {
    final providerUser = context.read<FirebaseProvider>();
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> sharedMap = {};
      final healthMap = {
        "Gender": _genderController.text.trim(),
        "height": _heightController.text.toString(),
        "weight": _weightController.text.toString(),
        "medical_condition": _medicalConditionController.text.trim(),
        "fitness_level": _fitnessLevel.toString(),
      };
      sharedMap
        ..addAll(widget.userMap)
        ..addAll(healthMap);
 
      try {
        providerUser.registerUser(
          email: sharedMap["email"],
          password: sharedMap["password"],
          firstName: sharedMap["firstName"],
          lastName: sharedMap["lastName"],
          userDetails: healthMap,
          context: context,
        );
      } catch (e) {
        _toggleLoading();
        toastContainer(context: context, msg: "$e", color: RED);
      }

    }
  }
}
