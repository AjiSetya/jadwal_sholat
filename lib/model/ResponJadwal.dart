import 'dart:core';

import 'items.dart';
import 'today_weather.dart';
class ResponJadwal {
	String title;
	String query;
	int method;
	String prayerMethodName;
	String daylight;
	String timezone;
	String mapImage;
	String sealevel;
	TodayWeather todayWeather;
	String link;
	String qiblaDirection;
	String latitude;
	String longitude;
	String address;
	String city;
	String state;
	String postalCode;
	String country;
	String countryCode;
	List<Items> items;
	int statusValid;
	int statusCode;
	String statusDescription;

	ResponJadwal({this.title, this.query, this.method, this.prayerMethodName, this.daylight, this.timezone, this.mapImage, this.sealevel, this.todayWeather, this.link, this.qiblaDirection, this.latitude, this.longitude, this.address, this.city, this.state, this.postalCode, this.country, this.countryCode, this.items, this.statusValid, this.statusCode, this.statusDescription});

	ResponJadwal.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		query = json['query'];	
		method = json['method'];
		prayerMethodName = json['prayer_method_name'];
		daylight = json['daylight'];
		timezone = json['timezone'];
		mapImage = json['map_image'];
		sealevel = json['sealevel'];
		todayWeather = json['today_weather'] != null ? new TodayWeather.fromJson(json['today_weather']) : null;
		link = json['link'];
		qiblaDirection = json['qibla_direction'];
		latitude = json['latitude'];
		longitude = json['longitude'];
		address = json['address'];
		city = json['city'];
		state = json['state'];
		postalCode = json['postal_code'];
		country = json['country'];
		countryCode = json['country_code'];
		if (json['items'] != null) {
			items = new List<Items>();
			json['items'].forEach((v) { items.add(new Items.fromJson(v)); });
		}
		statusValid = json['status_valid'];
		statusCode = json['status_code'];
		statusDescription = json['status_description'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['query'] = this.query;
		data['method'] = this.method;
		data['prayer_method_name'] = this.prayerMethodName;
		data['daylight'] = this.daylight;
		data['timezone'] = this.timezone;
		data['map_image'] = this.mapImage;
		data['sealevel'] = this.sealevel;
		if (this.todayWeather != null) {
      data['today_weather'] = this.todayWeather.toJson();
    }
		data['link'] = this.link;
		data['qibla_direction'] = this.qiblaDirection;
		data['latitude'] = this.latitude;
		data['longitude'] = this.longitude;
		data['address'] = this.address;
		data['city'] = this.city;
		data['state'] = this.state;
		data['postal_code'] = this.postalCode;
		data['country'] = this.country;
		data['country_code'] = this.countryCode;
		if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
		data['status_valid'] = this.statusValid;
		data['status_code'] = this.statusCode;
		data['status_description'] = this.statusDescription;
		return data;
	}
}