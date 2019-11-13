import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'text_style.dart';
import 'model/Jadwal.dart';

class ShowHeaderUI extends StatelessWidget {
  Jadwal data;

  ShowHeaderUI(this.data);

  String getDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat.yMMMMd();
    String formatted = formatter.format(now);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          data.city,
          style: styleCityHeader,
        ),
        Text(
          data.address,
          style: styleAdressHeader,
        ),
        Text(
          getDate(),
          style: styleTanggalHeader,
        )
      ],
    );
  }
}
