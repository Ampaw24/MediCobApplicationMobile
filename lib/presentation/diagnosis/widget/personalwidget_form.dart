import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/custom_text_form_field.dart';
import 'package:newmedicob/presentation/diagnosis/symptomsform.dart';
import '../../../../core/button.dart';
import '../../../../core/colors.dart';
import '../../../../core/image_constant.dart';
import '../../../../core/textstyles.dart';

Widget PersonalFormWidget({
  @required TextEditingController? heightController,
  @required TextEditingController? weightController,
  @required TextEditingController? firstnameController,
  @required TextEditingController? nhisController,
  @required TextEditingController? genderController,
  @required TextEditingController? bloodGroupController,
  @required TextEditingController? genoTypeController,
  @required FocusNode? heightFocusNode,
  @required FocusNode? weightFocusNode,
  @required FocusNode? firstnameFocusNode,
  @required FocusNode? nhisFocusNode,
  @required FocusNode? genderFocusNode,
  @required FocusNode? bloodGroupFocusNode,
  @required FocusNode? genotypeGroupFocusNode,
  @required void Function()? onRegister,
  @required void Function()? onForgetPassword,
  @required Key? key,
  required BuildContext? context,
  required bool isLoading,
}) {
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> bloodGroupOptions = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  List<String> genotypeOptions = ['AA', 'AS', 'SS', 'AC', 'SC'];

  return SingleChildScrollView(
    child: Form(
      key: key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 250,
              width: 300,
              child: Image.asset(ImageConstant.robotLogo),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Patient Full Name",
                    style: subheaderText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormField(
                  suffix: const Icon(Iconsax.user),
                  hintText: "Name",
                  controller: firstnameController,
                  focusNode: firstnameFocusNode,
                  fillColor: WHITE,
                  hintStyle: subheaderText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "NHIS ID",
                    style: subheaderText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextFormField(
                  suffix: const Icon(Iconsax.personalcard),
                  autofocus: false,
                  hintText: "NHIS Card Number",
                  controller: nhisController,
                  focusNode: nhisFocusNode,
                  fillColor: WHITE,
                  hintStyle: subheaderText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter NHIS ID';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
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
                              "Height(m)",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            textInputType:
                                TextInputType.numberWithOptions(decimal: true),
                            autofocus: false,
                            hintText: "Height",
                            controller: heightController,
                            focusNode: heightFocusNode,
                            fillColor: WHITE,
                            hintStyle: subheaderText,
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Iconsax.minus),
                                  onPressed: () {
                                    int currentValue = int.tryParse(
                                            heightController?.text ?? '0') ??
                                        0;
                                    if (currentValue > 0) {
                                      heightController?.text =
                                          (currentValue - 1).toString();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Iconsax.add),
                                  onPressed: () {
                                    int currentValue = int.tryParse(
                                            heightController?.text ?? '0') ??
                                        0;
                                    heightController?.text =
                                        (currentValue + 1).toString();
                                  },
                                ),
                              ],
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter height';
                              }
                              return null;
                            },
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
                              "Weight(Kg)",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            textInputType:
                                TextInputType.numberWithOptions(decimal: true),
                            autofocus: false,
                            hintText: "Weight",
                            controller: weightController,
                            focusNode: weightFocusNode,
                            fillColor: WHITE,
                            hintStyle: subheaderText,
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Iconsax.minus),
                                  onPressed: () {
                                    double weightcurrentValue = double.tryParse(
                                            weightController?.text ?? '0') ??
                                        0;
                                    if (weightcurrentValue > 0) {
                                      weightController?.text =
                                          (weightcurrentValue - 1).toString();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Iconsax.add),
                                  onPressed: () {
                                    double weightcurrentValue = double.tryParse(
                                            weightController?.text ?? '0') ??
                                        0;
                                    weightController?.text =
                                        (weightcurrentValue + 0.5).toString();
                                  },
                                ),
                              ],
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter weight';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
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
                              "Blood Type",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              filled: true,
                              fillColor: WHITE,
                              hintStyle: subheaderText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            hint: Text(
                              'Blood Type',
                              style: subheaderText,
                            ),
                            value: bloodGroupController?.text.isNotEmpty == true
                                ? bloodGroupController?.text
                                : null,
                            onChanged: (String? newValue) {
                              bloodGroupController?.text = newValue!;
                            },
                            items: bloodGroupOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a blood type';
                              }
                              return null;
                            },
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
                              "Genotype",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              filled: true,
                              fillColor: WHITE,
                              hintStyle: subheaderText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            hint: Text(
                              'Choose Genotype',
                              style: subheaderText,
                            ),
                            value: genoTypeController?.text.isNotEmpty == true
                                ? genoTypeController?.text
                                : null,
                            onChanged: (String? newValue) {
                              genoTypeController?.text = newValue!;
                            },
                            items: genotypeOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a genotype';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gender",
                    style: subheaderText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                  value: genderController?.text.isNotEmpty == true
                      ? genderController?.text
                      : null,
                  onChanged: (String? newValue) {
                    genderController?.text = newValue!;
                  },
                  items: genderOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a gender';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonTheme(
                  minWidth: 500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: button(
                    buttonRadius: 10,
                    height: 55,
                    onPressed: onRegister,
                    text: "Continue",
                    color: Colors.transparent,
                    context: context,
                    showLoadingIndicator: isLoading,
                    useGradient: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
