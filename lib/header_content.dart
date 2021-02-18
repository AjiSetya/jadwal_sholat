import 'package:flutter/material.dart';
import 'package:jadwal_sholat/model/respon_jadwal.dart';
import 'package:jadwal_sholat/text_style.dart';

class HeaderContent extends StatelessWidget {
  ResponJadwal responJadwal;

  HeaderContent(this.responJadwal);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      bottom: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(responJadwal.results.location.city, style: styleCityHeader),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 20.0,
              ),
              Text(responJadwal.results.location.country,
                  style: styleAdressHeader)
            ],
          )
        ],
      ),
    );
  }
}
