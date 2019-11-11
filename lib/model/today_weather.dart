
class Today_weather {

  int pressure;
  String temperature;

	Today_weather.fromJsonMap(Map<String, dynamic> map): 
		pressure = map["pressure"],
		temperature = map["temperature"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pressure'] = pressure;
		data['temperature'] = temperature;
		return data;
	}
}
