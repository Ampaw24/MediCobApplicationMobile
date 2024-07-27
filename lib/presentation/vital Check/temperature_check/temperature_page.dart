import 'package:flutter/material.dart';


class TemperatureConversionPage extends StatefulWidget {
  @override
  _TemperatureConversionPageState createState() => _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  final TextEditingController _controller = TextEditingController();
  double? _convertedTemperature;

  void _convertTemperature() {
    setState(() {
      double? inputTemperature = double.tryParse(_controller.text);
      if (inputTemperature != null) {
        // Convert to another unit, e.g., Fahrenheit to Celsius
        _convertedTemperature = (inputTemperature - 32) * 5 / 9;
      } else {
        _convertedTemperature = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter temperature in Fahrenheit',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            if (_convertedTemperature != null)
              Text(
                'Temperature in Celsius: ${_convertedTemperature!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
