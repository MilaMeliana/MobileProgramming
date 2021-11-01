import 'dart:html';

import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  const TimePage({Key? key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                _getTime(context);
              },
              child: Text('Time Picker', style: TextStyle(color: Colors.green)),
            ),
            SizedBox(
              height: 15,
            ),
            Text('Time Value : ' + _selectedTime.format(context),
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      backgroundColor: Colors.green,
    );
  }

  _getTime(context) async {
    final _timePick = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        });
    if (_timePick != null) {
      setState(() {
        _selectedTime = _timePick;
      });
    }
  }
}
