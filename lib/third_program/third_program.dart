import 'package:flutter/material.dart';

class ThirdProgram extends StatefulWidget {
  @override
  _ThirdProgramState createState() => _ThirdProgramState();
}

class _ThirdProgramState extends State<ThirdProgram> {
  final mahasiswa = Mahasiswa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program #3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hasil Yudisium'),
            Text(mahasiswa.getYudisium()),
          ],
        ),
      ),
    );
  }
}

class Mahasiswa {
  final nilai = ['A', 'B', 'B', 'E', 'C', 'B', 'B'];
  final sks = [2, 3, 3, 2, 2, 2, 3];

  int nilaiMutu(String harkat, int sks) {
    switch (harkat) {
      case 'A':
        return 4 * sks;
      case 'B':
        return 3 * sks;
      case 'C':
        return 2 * sks;
      case 'D':
        return 1 * sks;
      default:
        return 0;
    }
  }

  double nilaiIpk() {
    var totalNilaiMutu = 0;
    var totalSks = 0;

    for (var i = 0; i < nilai.length; i++) {
      totalNilaiMutu = totalNilaiMutu + nilaiMutu(nilai[i], sks[i]);
      totalSks = totalSks + sks[i];
    }

    return totalNilaiMutu / totalSks;
  }

  String getYudisium() {
    final ipk = nilaiIpk();

    if (ipk >= 2 && ipk < 2.75) {
      return 'Memuaskan';
    } else if (ipk >= 2.75 && ipk < 3.5) {
      return 'Sangat Memuaskan';
    } else if (ipk >= 3.5) {
      return 'Cum Laude';
    } else {
      return 'Pending';
    }
  }
}
