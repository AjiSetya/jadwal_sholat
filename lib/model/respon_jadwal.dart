class ResponJadwal {
  int code;
  String status;
  Results results;

  ResponJadwal({this.code, this.status, this.results});

  ResponJadwal.fromJson(dynamic json) {
    code = json["code"];
    status = json["status"];
    results =
        json["results"] != null ? Results.fromJson(json["results"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["status"] = status;
    if (results != null) {
      map["results"] = results.toJson();
    }
    return map;
  }
}

class Results {
  List<Datetime> datetime;
  Location location;
  Settings settings;

  Results({this.datetime, this.location, this.settings});

  Results.fromJson(dynamic json) {
    if (json["datetime"] != null) {
      datetime = [];
      json["datetime"].forEach((v) {
        datetime.add(Datetime.fromJson(v));
      });
    }
    location =
        json["location"] != null ? Location.fromJson(json["location"]) : null;
    settings =
        json["settings"] != null ? Settings.fromJson(json["settings"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (datetime != null) {
      map["datetime"] = datetime.map((v) => v.toJson()).toList();
    }
    if (location != null) {
      map["location"] = location.toJson();
    }
    if (settings != null) {
      map["settings"] = settings.toJson();
    }
    return map;
  }
}

class Settings {
  String timeformat;
  String school;
  String juristic;
  String highlat;
  double fajrAngle;
  double ishaAngle;

  Settings(
      {this.timeformat,
      this.school,
      this.juristic,
      this.highlat,
      this.fajrAngle,
      this.ishaAngle});

  Settings.fromJson(dynamic json) {
    timeformat = json["timeformat"];
    school = json["school"];
    juristic = json["juristic"];
    highlat = json["highlat"];
    fajrAngle = json["fajr_angle"];
    ishaAngle = json["isha_angle"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["timeformat"] = timeformat;
    map["school"] = school;
    map["juristic"] = juristic;
    map["highlat"] = highlat;
    map["fajr_angle"] = fajrAngle;
    map["isha_angle"] = ishaAngle;
    return map;
  }
}

class Location {
  double latitude;
  double longitude;
  double elevation;
  String city;
  String country;
  String countryCode;
  String timezone;
  double localOffset;

  Location(
      {this.latitude,
      this.longitude,
      this.elevation,
      this.city,
      this.country,
      this.countryCode,
      this.timezone,
      this.localOffset});

  Location.fromJson(dynamic json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
    elevation = json["elevation"];
    city = json["city"];
    country = json["country"];
    countryCode = json["country_code"];
    timezone = json["timezone"];
    localOffset = json["local_offset"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["latitude"] = latitude;
    map["longitude"] = longitude;
    map["elevation"] = elevation;
    map["city"] = city;
    map["country"] = country;
    map["country_code"] = countryCode;
    map["timezone"] = timezone;
    map["local_offset"] = localOffset;
    return map;
  }
}

class Datetime {
  Times times;
  Date date;

  Datetime({this.times, this.date});

  Datetime.fromJson(dynamic json) {
    times = json["times"] != null ? Times.fromJson(json["times"]) : null;
    date = json["date"] != null ? Date.fromJson(json["date"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (times != null) {
      map["times"] = times.toJson();
    }
    if (date != null) {
      map["date"] = date.toJson();
    }
    return map;
  }
}

class Date {
  int timestamp;
  String gregorian;
  String hijri;

  Date({this.timestamp, this.gregorian, this.hijri});

  Date.fromJson(dynamic json) {
    timestamp = json["timestamp"];
    gregorian = json["gregorian"];
    hijri = json["hijri"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["timestamp"] = timestamp;
    map["gregorian"] = gregorian;
    map["hijri"] = hijri;
    return map;
  }
}

class Times {
  String imsak;
  String sunrise;
  String fajr;
  String dhuhr;
  String asr;
  String sunset;
  String maghrib;
  String isha;
  String midnight;

  Times(
      {this.imsak,
      this.sunrise,
      this.fajr,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.midnight});

  Times.fromJson(dynamic json) {
    imsak = json["Imsak"];
    sunrise = json["Sunrise"];
    fajr = json["Fajr"];
    dhuhr = json["Dhuhr"];
    asr = json["Asr"];
    sunset = json["Sunset"];
    maghrib = json["Maghrib"];
    isha = json["Isha"];
    midnight = json["Midnight"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Imsak"] = imsak;
    map["Sunrise"] = sunrise;
    map["Fajr"] = fajr;
    map["Dhuhr"] = dhuhr;
    map["Asr"] = asr;
    map["Sunset"] = sunset;
    map["Maghrib"] = maghrib;
    map["Isha"] = isha;
    map["Midnight"] = midnight;
    return map;
  }
}
