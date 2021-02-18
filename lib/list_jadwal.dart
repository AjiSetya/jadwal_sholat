import 'package:flutter/material.dart';
import 'package:jadwal_sholat/model/respon_jadwal.dart';
import 'package:jadwal_sholat/text_style.dart';

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
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: data.results.datetime.length,
        itemBuilder: (BuildContext context, int index) {
          Times waktu = data.results.datetime[0].times;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              containerWaktu("Subuh", waktu.fajr.toUpperCase()),
              containerWaktu("Dzuhur", waktu.dhuhr.toUpperCase()),
              containerWaktu("Ashar", waktu.asr.toUpperCase()),
              containerWaktu("Maghrib", waktu.maghrib.toUpperCase()),
              containerWaktu("Isya", waktu.isha.toUpperCase()),
            ],
          );
        });
  }
}
