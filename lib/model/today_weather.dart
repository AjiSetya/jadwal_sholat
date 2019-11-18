class TodayWeather {
	int pressure;
	String temperature;

	TodayWeather({this.pressure, this.temperature});

	TodayWeather.fromJson(Map<String, dynamic> json) {
		pressure = json['pressure'];
		temperature = json['temperature'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pressure'] = this.pressure;
		data['temperature'] = this.temperature;
		return data;
	}
}