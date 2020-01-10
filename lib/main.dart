import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:intl/intl.dart' show DateFormat;

void main() {

  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff262832),
        body: Clock(),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String time = DateFormat("jms")
      .format(DateTime.now())
      .replaceAll(':', '  ')
      .replaceAll("PM", ' ')
      .replaceAll("AM", ' ')
      .trim()
      .padLeft(10, "0");

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        time = DateFormat("jms")
            .format(DateTime.now())
            .replaceAll(':', '  ')
            .replaceAll("PM", ' ')
            .replaceAll("AM", ' ')
            .trim()
            .padLeft(10, "0");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double textSize = MediaQuery.of(context).size.width / 7;

    return Align(
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Container(
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                time,
                style: TextStyle(
                    fontFamily: 'Barcode',
                    fontSize: textSize,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
