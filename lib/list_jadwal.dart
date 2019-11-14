import 'package:flutter/material.dart';
import 'package:jadwal_sholat/text_style.dart';

import 'model/ResponJadwal.dart';

class ListJadwal extends StatelessWidget {
  ResponJadwal data;

  ListJadwal(this.data);

  Widget containerWaktu(String waktu, String jam) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff808080), Color(0xff3fada8)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(waktu, style: styleListText),
            Text(jam, style: styleListText)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        containerWaktu("Subuh", data.items[0].fajr.toUpperCase()),
        containerWaktu("Dzuhur", data.items[0].dhuhr.toUpperCase()),
        containerWaktu("Ashar", data.items[0].asr.toUpperCase()),
        containerWaktu("Maghrib", data.items[0].maghrib.toUpperCase()),
        containerWaktu("Isya", data.items[0].isha.toUpperCase()),
      ],
    );
  }
}
