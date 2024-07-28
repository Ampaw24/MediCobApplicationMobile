import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:newmedicob/core/app_export.dart';
import 'package:newmedicob/presentation/vital%20Check/PPG/model/sensor_model.dart';
import 'package:newmedicob/presentation/vital%20Check/temperature_check/provider/vital_check_provider.dart';
import 'chart.dart';

class PPGView extends StatefulWidget {
  @override
  PPGViewView createState() {
    return PPGViewView();
  }
}

class PPGViewView extends State<PPGView> with SingleTickerProviderStateMixin {
  bool _toggled = false; // toggle button value
  final List<SensorValue> _data = []; // array to store the values
  CameraController? _controller;
  double _alpha = 0.3; // factor for the mean value
  AnimationController? _animationController;
  double _iconScale = 1;
  int _bpm = 0; // beats per minute
  int _fs = 30; // sampling frequency (fps)
  int _windowLen = 30 * 6; // window length to display - 6 seconds
  CameraImage? _image; // store the last camera image
  double? _avg; // store the average value during calculation
  DateTime? _now; // store the now Datetime
  Timer? _timer; // timer for image processing

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animationController!.addListener(() {
      setState(() {
        _iconScale = 1.0 + _animationController!.value * 0.4;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _disposeController();
    _animationController?.stop();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vitals_provider = context.read<VitalCheckProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: <Widget>[
                            if (_controller != null && _toggled)
                              AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: CameraPreview(_controller!),
                              )
                            else
                              Container(
                                padding: EdgeInsets.all(12),
                                alignment: Alignment.center,
                                color: Colors.grey,
                                child: Text(
                                  _toggled
                                      ? "Cover both the camera and the flash with your finger"
                                      : "Camera feed will display here",
                                  style: TextStyle(
                                    backgroundColor: _toggled
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Estimated BPM",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            (_bpm > 30 && _bpm < 150 ? _bpm.toString() : "--"),
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Transform.scale(
                  scale: _iconScale,
                  child: IconButton(
                    icon:
                        Icon(_toggled ? Icons.favorite : Icons.favorite_border),
                    color: Colors.red,
                    iconSize: 128,
                    onPressed: () {
                      if (_toggled) {
                        _untoggle();
                      } else {
                        _toggle();
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  color: Colors.black,
                ),
                child: Chart(_data),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearData() {
    _data.clear();
    int now = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < _windowLen; i++) {
      _data.insert(
        0,
        SensorValue(
          DateTime.fromMillisecondsSinceEpoch(now - i * 1000 ~/ _fs),
          128,
        ),
      );
    }
  }

  void _toggle() {
    _clearData();
    _initController().then((_) {
      _animationController?.repeat(reverse: true);
      setState(() {
        _toggled = true;
      });
      _initTimer();
      _updateBPM();
    });
  }

  void _untoggle() {
    _disposeController();
    _animationController?.stop();
    _animationController?.value = 0.0;
    setState(() {
      _toggled = false;
    });
  }

  void _disposeController() {
    _controller?.dispose();
    _controller = null;
  }

  Future<void> _initController() async {
    try {
      final cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.low);
      await _controller!.initialize();
      await Future.delayed(Duration(milliseconds: 100));
      _controller!.setFlashMode(FlashMode.torch);
      _controller!.startImageStream((CameraImage image) {
        _image = image;
      });
    } catch (e) {
      print("Camera initialization error: $e");
    }
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ _fs), (timer) {
      if (_toggled && _image != null) {
        _scanImage(_image!);
      } else {
        timer.cancel();
      }
    });
  }

  void _scanImage(CameraImage image) {
    _now = DateTime.now();
    _avg = image.planes.first.bytes.reduce((a, b) => a + b) /
        image.planes.first.bytes.length;
    if (_data.length >= _windowLen) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(_now!, 255 - _avg!));
    });
  }

  void _updateBPM() async {
    final bpmProvider = Provider.of<VitalCheckProvider>(context, listen: false);
    while (_toggled) {
      final List<SensorValue> values = List.from(_data);
      double avg = 0;
      int n = values.length;
      double m = 0;
      for (var value in values) {
        avg += value.value / n;
        if (value.value > m) m = value.value;
      }
      double threshold = (m + avg) / 2;
      double bpm = 0;
      int counter = 0;
      int previous = 0;
      for (int i = 1; i < n; i++) {
        if (values[i - 1].value < threshold && values[i].value > threshold) {
          if (previous != 0) {
            counter++;
            bpm +=
                60 * 1000 / (values[i].time.millisecondsSinceEpoch - previous);
          }
          previous = values[i].time.millisecondsSinceEpoch;
        }
      }
      if (counter > 0) {
        bpm = bpm / counter;
        setState(() {
          _bpm = ((1 - _alpha) * _bpm + _alpha * bpm).toInt();
        });
      }
      await Future.delayed(Duration(milliseconds: 1000 * _windowLen ~/ _fs));
    }

    // Show SnackBar with the final BPM
    if (!_toggled) {
      final String bpmMessage = _bpm > 0
          ? "Final BPM: $_bpm"
          : "Could not determine BPM. Please try again.";

      Get.showSnackbar(GetSnackBar(
        title: "PPG Checks Done",
        message: bpmMessage,
      ));

      // Navigate back after showing the SnackBar
      Future.delayed(Duration(seconds: 2), () {
        bpmProvider.updatePPG(double.parse(_bpm.toString()));
        Navigator.pop(context);
      });
    }
  }
}
