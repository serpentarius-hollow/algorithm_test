import 'package:flutter/material.dart';

class FirstProgram extends StatelessWidget {
  String sequence(int count) {
    var seq = '';
    final mark = [5]; // first mark after 5

    for (var i = 1; i <= count; i++) {
      seq = seq + i.toString();

      var sum = 0;
      mark.forEach((e) => sum += e);

      if (i == sum) {
        seq = seq + '#';

        if (mark.last == 5) {
          mark.add(3);
        } else {
          mark.add(5);
        }
      }
    }

    return seq;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Program #1')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                sequence(1000),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
