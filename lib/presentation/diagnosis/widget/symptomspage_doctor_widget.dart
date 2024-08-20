import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/button.dart';
import '../../../../core/colors.dart';
import '../../../../core/image_constant.dart';
import '../../../../core/textstyles.dart';

Widget SymptomDetailsDoctor({
  @required TextEditingController? relieveMeasuresController,
  @required TextEditingController? locationController,
  @required TextEditingController? moodOrEmotionsController,
  @required FocusNode? relieveMeasuresFocusNode,
  @required FocusNode? locationFocusNode,
  @required FocusNode? moodOrEmotionsFocusNode,
  @required void Function()? onRegister,
  @required Key? key,
  required BuildContext? context,
  required bool isLoading,
}) {
  List<String> relieveMeasuresList = [
    "Rest",
    "Medication",
    "Hydration",
    "Exercise",
    "Diet",
    "Sleep",
    "Other (please specify)"
  ];
  List<String> locationList = [
    "Head",
    "Chest",
    "Abdomen",
    "Back",
    "Legs",
    "Arms",
    "Other (please specify)"
  ];
  List<String> moodOrEmotionsList = [
    "Happy",
    "Sad",
    "Anxious",
    "Angry",
    "Neutral",
    "Stressed",
    "Depressed",
    "Other (please specify)"
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
                  "Tell us more about your symptoms",
                  style: subheaderText,
                ),
              ),
              const Gap(10),
              // Relieve Measures
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Relieve Measures",
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
                    'Select Relieve Measure',
                    style: subheaderText,
                  ),
                  value: relieveMeasuresController?.text.isNotEmpty == true
                      ? relieveMeasuresController?.text
                      : null,
                  onChanged: (String? newValue) {
                    relieveMeasuresController?.text = newValue!;
                  },
                  items: relieveMeasuresList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              // Location
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Location",
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
                    'Select Location',
                    style: subheaderText,
                  ),
                  value: locationController?.text.isNotEmpty == true
                      ? locationController?.text
                      : null,
                  onChanged: (String? newValue) {
                    locationController?.text = newValue!;
                  },
                  items: locationList
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
                    "Mood or Emotions",
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
                    'Select Mood or Emotion',
                    style: subheaderText,
                  ),
                  value: moodOrEmotionsController?.text.isNotEmpty == true
                      ? moodOrEmotionsController?.text
                      : null,
                  onChanged: (String? newValue) {
                    moodOrEmotionsController?.text = newValue!;
                  },
                  items: moodOrEmotionsList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const Gap(10),
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
