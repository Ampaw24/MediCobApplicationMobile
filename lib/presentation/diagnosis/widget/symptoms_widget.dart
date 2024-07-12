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
  @required FocusNode? symptomsFocusNode,
  @required FocusNode? durationFocusNode,
  @required FocusNode? frequencyFocusNode,
  @required FocusNode? triggerFocusNode,
  @required FocusNode? notesFocusNode,
  @required FocusNode? levelFocusNode,
  @required void Function()? onRegister,
  @required void Function()? onForgetPassword,
  @required Key? key,
  required BuildContext? context,
  required bool isLoading,
}) {
  List<String> symptomType = [
    "Headache",
    "Cough",
    "Fever",
    "Sore throat",
    "Runny nose",
    "Shortness of breath",
    "Diarrhea",
    "Vomiting",
    "Rash",
    "Muscle aches",
    "Chills",
    "Loss of taste or smell",
    "Other (please specify)"
  ];
  List<String> triggerList = [
    "Food",
    "Stress",
    "Weather",
    "Medication",
    "Exercise",
    "Injury",
    "Illness",
    "Travel",
    "Sleep",
    "Alcohol",
    "Caffeine",
    "Dehydration",
    "Sensory overload (noise, lights, crowds)",
    "Emotional state (anxiety, anger, sadness)"
  ];
  List<String> frequentList = [
    'Daily',
    'Weekly',
    'Monthly',
    'Annual',
    'New Signs'
  ];

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
              const Gap(10),
              //symptom type here
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Symptom Type",
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
                    ' Symptom ',
                    style: subheaderText,
                  ),
                  value: symptomTypeController?.text.isNotEmpty == true
                      ? symptomTypeController?.text
                      : null,
                  onChanged: (String? newValue) {
                    symptomTypeController?.text = newValue!;
                  },
                  items:
                      symptomType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                              "Level (1-10)",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            autofocus: false,
                            hintText: "Pain Level",
                            controller: levelController,
                            focusNode: levelFocusNode,
                            fillColor: WHITE,
                            hintStyle: subheaderText,
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Iconsax.minus),
                                  onPressed: () {
                                    int currentValue = int.tryParse(
                                            levelController?.text ?? '0') ??
                                        0;
                                    if (currentValue > 0) {
                                      levelController?.text =
                                          (currentValue - 1).toString();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Iconsax.add),
                                  onPressed: () {
                                    int currentValue = int.tryParse(
                                            levelController?.text ?? '0') ??
                                        0;
                                    if (currentValue != 10) {
                                      levelController?.text =
                                          (currentValue + 1).toString();
                                    }
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
                              "Duration (hr)",
                              style: subheaderText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextFormField(
                            autofocus: false,
                            hintText: "Pain Time",
                            controller: durationController,
                            focusNode: durationFocusNode,
                            fillColor: WHITE,
                            hintStyle: subheaderText,
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Iconsax.minus),
                                  onPressed: () {
                                    int durationValue = int.tryParse(
                                            durationController?.text ?? '0') ??
                                        0;
                                    if (durationValue > 0) {
                                      durationController?.text =
                                          (durationValue - 1).toString();
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Iconsax.add),
                                  onPressed: () {
                                    int durationValue = int.tryParse(
                                            durationController?.text ?? '0') ??
                                        0;

                                    durationController?.text =
                                        (durationValue + 1).toString();
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
              const SizedBox(height: 10),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Frequency",
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
                    'Select How Frequent.',
                    style: subheaderText,
                  ),
                  value: frequencyController?.text.isNotEmpty == true
                      ? frequencyController?.text
                      : null,
                  onChanged: (String? newValue) {
                    frequencyController?.text = newValue!;
                  },
                  items: frequentList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Trigger",
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
                    'Trigger',
                    style: subheaderText,
                  ),
                  value: triggerController?.text.isNotEmpty == true
                      ? triggerController?.text
                      : null,
                  onChanged: (String? newValue) {
                    triggerController?.text = newValue!;
                  },
                  items:
                      triggerList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const Gap(10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notes(Patients Additional Symptoms Check)",
                    style: subheaderText,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: CustomTextFormField(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  autofocus: false,
                  hintText: "Additional Notes",
                  controller: notesController,
                  focusNode: durationFocusNode,
                  fillColor: WHITE,
                  hintStyle: subheaderText,
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
