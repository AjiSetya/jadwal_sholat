
class Items {

  String date_for;
  String fajr;
  String shurooq;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

	Items.fromJsonMap(Map<String, dynamic> map): 
		date_for = map["date_for"],
		fajr = map["fajr"],
		shurooq = map["shurooq"],
		dhuhr = map["dhuhr"],
		asr = map["asr"],
		maghrib = map["maghrib"],
		isha = map["isha"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date_for'] = date_for;
		data['fajr'] = fajr;
		data['shurooq'] = shurooq;
		data['dhuhr'] = dhuhr;
		data['asr'] = asr;
		data['maghrib'] = maghrib;
		data['isha'] = isha;
		return data;
	}
}
