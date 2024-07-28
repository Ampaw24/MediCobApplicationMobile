import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/image_constant.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/provider/vital_check_provider.dart';

class TemperatureConversionPage extends StatefulWidget {
  @override
  _TemperatureConversionPageState createState() =>
      _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  final TextEditingController _controller = TextEditingController();
  double? _convertedTemperature;
  void _convertTemperature(String value) {
    setState(() {
      double? inputTemperature = double.tryParse(value);
      if (inputTemperature != null) {
        _convertedTemperature = (inputTemperature * 9 / 5) + 32;
      } else {
        _convertedTemperature = null;
      }
    });
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(ImageConstant.temperature_ill),
                  ),
                  if (_convertedTemperature != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Temperature in Fahrenheit: ${_convertedTemperature!.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  TextField(
                    controller: _controller,
                    onChanged: _convertTemperature,
                    decoration: InputDecoration(
                      labelText: 'Enter temperature in Celsius',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
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
        ],
      ),
    );
  }
}
