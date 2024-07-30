import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:newmedicob/presentation/vital%20Check/PPG/chartModule.dart';
import 'package:newmedicob/presentation/vital%20Check/PPG/model/sensor_model.dart';

class PPOriginalPage extends StatefulWidget {
  const PPOriginalPage({super.key});

  @override
  State<PPOriginalPage> createState() => _PPOriginalPageState();
}

class _PPOriginalPageState extends State<PPOriginalPage> {
  bool _toggled = false; // toggle button value
  bool _isFinished = false; // measurement state
  int? _score = 0; // score or BPM
  CameraController? _controller; // camera controller
  int _timeToStartCounter = 5; // countdown time in seconds
  final _chartKey = GlobalKey(); // key for chart component
  final List<SensorValue> _data = <SensorValue>[]; // array to store the values

  Timer? _countdownTimer; // countdown timer

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _countdownTimer?.cancel();

    setState(() {
      _timeToStartCounter = 5;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeToStartCounter > 0) {
          _timeToStartCounter--;
        } else {
          timer.cancel();
          _startMeasurement();
        }
      });
    });
  }

  void _startMeasurement() {
    setState(() {
      _toggled = true;
    });

    // Initialize the camera or start the measurement process here
    // For now, we will just simulate the end of measurement.
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isFinished = true;
        _score = 75; // Example score, replace with actual BPM calculation
      });
    });
  }

  void _toggleMeasurement() {
    if (_toggled) {
      setState(() {
        _toggled = false;
        _isFinished = false;
      });
    } else {
      _startCountdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: <Widget>[
      _controller != null && _toggled
          ? AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: CameraPreview(_controller!),
            )
          : SizedBox(
              height: size.height * .3,
              width: double.infinity,
            ),
      SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Container(
                    height: 90,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('Heart Beat Rate',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      _toggled
                                          ? "Cover the camera and the flash with your finger"
                                          : "Camera feed will be displayed here\nCover the camera and the flash with your finger",
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    )),
                              ])
                        ])),
                Container(
                  constraints: BoxConstraints(
                      minHeight: size.height * .25,
                      minWidth: size.height * .25),
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: _toggleMeasurement,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      elevation: 6,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _isFinished
                                  ? "${_score!} BPM"
                                  : _toggled
                                      ? 'Measuring...'
                                      : 'Tap here to start',
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway'),
                            ),
                            _toggled && _timeToStartCounter > 0
                                ? Text(
                                    '$_timeToStartCounter s to start',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Raleway'),
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 20,
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 64,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                _toggled && _timeToStartCounter > 0
                    ? Text(
                        '$_timeToStartCounter s to start',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(255, 0, 0, .2)),
                  child: RepaintBoundary(
                      key: _chartKey, child: ChartComp(allData: _data)),
                )),
              ])))
    ]));
  }
}
