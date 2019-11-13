import 'package:flutter/material.dart';

import 'text_style.dart';
import 'model/Jadwal.dart';

class ShowListJadwalUI extends StatelessWidget {
  Jadwal data;

  ShowListJadwalUI(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 16.0),
      children: <Widget>[
        containerWaktu("Subuh", data.items[0].fajr),
        containerWaktu("Dzuhur", data.items[0].dhuhr),
        containerWaktu("Ashar", data.items[0].asr),
        containerWaktu("Maghrib", data.items[0].maghrib),
        containerWaktu("Isya", data.items[0].isha)
      ],
    );
  }

  Widget containerWaktu(String judul, String waktu) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
            gradient: LinearGradient(
              begin: Alignment.topRight,
//              end: Alignment(0.20, 2.0),
              end: Alignment.bottomLeft,
              colors: [Color(0xFF67B26F), Color(0xFF4ca2cd)],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              judul,
              style: styleJudul,
            ),
            Text(
              waktu,
              style: styleWaktu,
            )
          ],
        ),
      ),
    );
  }
}
