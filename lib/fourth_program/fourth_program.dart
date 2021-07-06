import 'package:flutter/material.dart';

class StringSequence {
  var joinedString = '';
  var stringId = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  final chars = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  String padThreeDigits(int digit) {
    return digit.toString().padLeft(3, '0');
  }

  List<String> loop() {
    final List<String> temp = [];
    var lastIndex = stringId.length - 1;
    var j = 0;

    while (joinedString != 'ZZZZZZZZZZ999') {
      if (j == 999) {
        joinedString = foo() + padThreeDigits(j);
        temp.add(joinedString);
        j = 0;

        stringId[lastIndex] = stringId[lastIndex] + 1;
        lastIndex = lastIndex - 1;
      } else {
        joinedString = foo() + padThreeDigits(j);
        temp.add(joinedString);
        j = j + 1;
      }
    }

    return temp;
  }

  String foo() {
    final temp = [];

    for (var e in stringId) {
      temp.add(chars[e]);
    }

    return temp.join();
  }
}

class FourthProgram extends StatelessWidget {
  final str = StringSequence();
  final ctrl = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Program #4')),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: str.loop().map((e) => Text(e)).toList(),
            )),
      ),
    );
  }
}
