import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondProgram extends StatefulWidget {
  @override
  _SecondProgramState createState() => _SecondProgramState();
}

class _SecondProgramState extends State<SecondProgram> {
  final ctrlSeconds = TextEditingController();

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  @override
  void dispose() {
    ctrlSeconds.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program #2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan Jumlah Detik',
              ),
              controller: ctrlSeconds,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final input = int.parse(ctrlSeconds.text);
                  final timeFormat = TimeFormat(input);

                  hours = timeFormat.formatTimeToHours();
                  minutes = timeFormat.formatTimeToMinutes();
                  seconds = timeFormat.formatTimeToSeconds();
                });
              },
              child: Text('Konversi'),
            ),
            SizedBox(
              height: 10,
            ),
            Text('$hours Jam, $minutes menit, $seconds detik')
          ],
        ),
      ),
    );
  }
}

class TimeFormat {
  final int seconds;

  TimeFormat(this.seconds);

  int formatTimeToHours() {
    return ((seconds / 3600) % 60).floor();
  }

  int formatTimeToMinutes() {
    return ((seconds / 60) % 60).floor();
  }

  int formatTimeToSeconds() {
    return (seconds % 60).floor();
  }
}
