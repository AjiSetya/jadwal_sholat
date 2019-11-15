import 'package:jadwal_sholat/model/today_weather.dart';
import 'package:jadwal_sholat/model/items.dart';

class ResponJadwal {
  String title;
  String query;
  String foor;
  int method;
  String prayer_method_name;
  String daylight;
  String timezone;
  String map_image;
  String sealevel;
  Today_weather today_weather;
  String link;
  String qibla_direction;
  String latitude;
  String longitude;
  String address;
  String city;
  String state;
  String postal_code;
  String country;
  String country_code;
  List<Items> items;
  int status_valid;
  int status_code;
  String status_description;

  ResponJadwal.fromJsonMap(Map<String, dynamic> map)
      : title = map["title"],
        query = map["query"],
        foor = map["for"],
        method = map["method"],
        prayer_method_name = map["prayer_method_name"],
        daylight = map["daylight"],
        timezone = map["timezone"],
        map_image = map["map_image"],
        sealevel = map["sealevel"],
        today_weather = Today_weather.fromJsonMap(map["today_weather"]),
        link = map["link"],
        qibla_direction = map["qibla_direction"],
        latitude = map["latitude"],
        longitude = map["longitude"],
        address = map["address"],
        city = map["city"],
        state = map["state"],
        postal_code = map["postal_code"],
        country = map["country"],
        country_code = map["country_code"],
        items =
            List<Items>.from(map["items"].map((it) => Items.fromJsonMap(it))),
        status_valid = map["status_valid"],
        status_code = map["status_code"],
        status_description = map["status_description"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['query'] = query;
    data['for'] = foor;
    data['method'] = method;
    data['prayer_method_name'] = prayer_method_name;
    data['daylight'] = daylight;
    data['timezone'] = timezone;
    data['map_image'] = map_image;
    data['sealevel'] = sealevel;
    data['today_weather'] =
        today_weather == null ? null : today_weather.toJson();
    data['link'] = link;
    data['qibla_direction'] = qibla_direction;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postal_code;
    data['country'] = country;
    data['country_code'] = country_code;
    data['items'] =
        items != null ? this.items.map((v) => v.toJson()).toList() : null;
    data['status_valid'] = status_valid;
    data['status_code'] = status_code;
    data['status_description'] = status_description;
    return data;
  }
}
