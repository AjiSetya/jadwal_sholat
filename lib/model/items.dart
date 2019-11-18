class Items {
	String dateFor;
	String fajr;
	String shurooq;
	String dhuhr;
	String asr;
	String maghrib;
	String isha;

	Items({this.dateFor, this.fajr, this.shurooq, this.dhuhr, this.asr, this.maghrib, this.isha});

	Items.fromJson(Map<String, dynamic> json) {
		dateFor = json['date_for'];
		fajr = json['fajr'];
		shurooq = json['shurooq'];
		dhuhr = json['dhuhr'];
		asr = json['asr'];
		maghrib = json['maghrib'];
		isha = json['isha'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date_for'] = this.dateFor;
		data['fajr'] = this.fajr;
		data['shurooq'] = this.shurooq;
		data['dhuhr'] = this.dhuhr;
		data['asr'] = this.asr;
		data['maghrib'] = this.maghrib;
		data['isha'] = this.isha;
		return data;
	}
}