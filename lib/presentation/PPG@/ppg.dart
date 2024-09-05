import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:heart_bpm/chart.dart';
import 'package:heart_bpm/heart_bpm.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/core/button.dart';
import 'package:newmedicob/core/colors.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/provider/vital_check_provider.dart';

class PPGApp extends StatefulWidget {
  @override
  _PPGAppState createState() => _PPGAppState();
}

class _PPGAppState extends State<PPGApp> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];
  bool isBPMEnabled = false;
  DateTime? startTime;
  double? averageBPM;

  @override
  Widget build(BuildContext context) {
    final vitalProvider = context.read<VitalCheckProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARYCOLOR,
        title: const Text(
          'Heart BPM Monitor',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Place your finger on the camera and press "Measure BPM"',
              style: TextStyle(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            isBPMEnabled
                ? HeartBPMDialog(
                    context: context,
                    onRawData: (value) {
                      setState(() {
                        if (data.length >= 100) data.removeAt(0);
                        data.add(value);
                        if (startTime == null) {
                          startTime = DateTime.now();
                        } else if (DateTime.now()
                                .difference(startTime!)
                                .inSeconds >=
                            10) {
                          averageBPM = bpmValues
                                  .map((e) => e.value)
                                  .reduce((a, b) => a + b) /
                              bpmValues.length;
                          isBPMEnabled = false;
                          // Navigate back after showing the average BPM
                          Future.delayed(Duration(seconds: 2), () {
                            vitalProvider.updatePPG(averageBPM!);
                            Get.snackbar(
                                "PPG", "Patient PPG added Successfully",
                                colorText: Colors.white,
                                backgroundColor: Colors.green);
                            Navigator.pop(
                                context, averageBPM!.toStringAsFixed(2));
                          });
                        }
                      });
                    },
                    onBPM: (value) => setState(() {
                      if (bpmValues.length >= 100) bpmValues.removeAt(0);
                      bpmValues.add(SensorValue(
                          value: value.toDouble(), time: DateTime.now()));
                    }),
                    sampleDelay: 1000 ~/ 20,
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: Icon(Icons.favorite, color: Colors.redAccent),
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: 20),
            if (averageBPM != null)
              Text(
                'Average BPM: ${averageBPM?.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 20),
            if (isBPMEnabled && data.isNotEmpty)
              Expanded(
                child: BPMChart(data),
              ),
            if (isBPMEnabled && bpmValues.isNotEmpty)
              Expanded(
                child: BPMChart(bpmValues),
              ),
            SizedBox(height: 20),
            ButtonTheme(
              minWidth: 500,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: button(
                height: 50,
                onPressed: () {
                  setState(() {
                    if (isBPMEnabled) {
                      isBPMEnabled = false;
                      startTime = null;
                      averageBPM = null;
                    } else {
                      isBPMEnabled = true;
                      data.clear();
                      bpmValues.clear();
                      startTime = DateTime.now();
                    }
                  });
                },
                text: isBPMEnabled ? "Stop measurement" : "Measure BPM",
                color: Colors.transparent,
                context: context,
                elevation: 0,
                useGradient: true,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: PPGApp()));
