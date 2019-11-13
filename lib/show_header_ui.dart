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
    return Positioned(
      left: 20.0,
      bottom: 30.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.city,
            style: styleCityHeader,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 15.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                data.address,
                style: styleAdressHeader,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              )
            ],
          )
        ],
      ),
    );
  }
}
