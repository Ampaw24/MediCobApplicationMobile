import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/custom_text_form_field.dart';
import '../../../../core/button.dart';
import '../../../../core/colors.dart';
import '../../../../core/image_constant.dart';
import '../../../../core/textstyles.dart';

Widget SymptomFormWidget({
  @required TextEditingController? symptomTypeController,
  @required TextEditingController? durationController,
  @required TextEditingController? frequencyController,
  @required TextEditingController? triggerController,
  @required TextEditingController? notesController,
  @required TextEditingController? levelController,
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
  List<String> genderOptions = [
    "daily",
    "weekly",
    "Monthly",
  ];
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
                  "Symptom Details",
                  style: headerText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Tell us how you are feeling",
                  style: subheaderText,
                ),
              ),
              const Gap(5),
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
                              "Height",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            autofocus: false,
                            hintText: "Choose Height",
                            controller: symptomTypeController,
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
                                            symptomTypeController?.text ??
                                                '0') ??
                                        0;
                                    if (currentValue > 0) {
                                      symptomTypeController?.text =
                                          (currentValue - 1).toString();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Iconsax.add),
                                  onPressed: () {
                                    int currentValue = int.tryParse(
                                            symptomTypeController?.text ??
                                                '0') ??
                                        0;
                                    symptomTypeController?.text =
                                        (currentValue + 1).toString();
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            autofocus: false,
                            hintText: "Weight",
                            controller: durationController,
                            focusNode: weightFocusNode,
                            fillColor: WHITE,
                            hintStyle: subheaderText,
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
                              'Choose Blood Type',
                              style: subheaderText,
                            ),
                            value: levelController?.text.isNotEmpty == true
                                ? levelController?.text
                                : null,
                            onChanged: (String? newValue) {
                              levelController?.text = newValue!;
                            },
                            items: bloodGroupOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
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
                            value: levelController?.text.isNotEmpty == true
                                ? levelController?.text
                                : null,
                            onChanged: (String? newValue) {
                              levelController?.text = newValue!;
                            },
                            items: genotypeOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
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
                  value: notesController?.text.isNotEmpty == true
                      ? notesController?.text
                      : null,
                  onChanged: (String? newValue) {
                    notesController?.text = newValue!;
                  },
                  items: genderOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                    onPressed: (() => onRegister!()),
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
