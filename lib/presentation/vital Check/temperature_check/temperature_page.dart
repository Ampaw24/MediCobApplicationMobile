import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/core/custom_text_form_field.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/core/textstyles.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/provider/vital_check_provider.dart';

class TemperatureConversionPage extends StatefulWidget {
  @override
  _TemperatureConversionPageState createState() =>
      _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  final TextEditingController _controller = TextEditingController();
  double? _convertedTemperature;
  FocusNode? temperature_focus;
  @override
  void initState() {
    super.initState();
    temperature_focus = FocusNode();
  }

  @override
  void dispose() {
    temperature_focus!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vital_provider = context.read<VitalCheckProvider>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Iconsax.close_circle)),
        title: Text('Temperature Check'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () => temperature_focus!.unfocus(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(ImageConstant.temperature_ill),
                    ),
                    AutoSizeText(
                        "Record Temperature taken, using the Thermometer "),
                    const Gap(10),
                    if (_convertedTemperature != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Temperature in Fahrenheit: ${_convertedTemperature!.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),


                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Temperature",
                          style: subheaderText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextFormField(
                        suffix: const Icon(Iconsax.user),
                        hintText: "Temperature",
                        controller: _controller,
                        focusNode: temperature_focus,
                        fillColor: WHITE,
                        hintStyle: subheaderText,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    button(
                      onPressed: () async {
                        vital_provider
                            .updateTemperature(double.parse(_controller.text));

                        Get.snackbar("Temperature",
                            "Patient Temperature added Successfully",
                            colorText: Colors.white,
                            backgroundColor: Colors.green);
                        Navigator.pop(context);
                      },
                      text: "Add Temperature",
                      color: Colors.transparent,
                      context: context,
                      useGradient: true,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
