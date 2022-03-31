class WeatherResponse {
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  int? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;
  int? _cod;

  WeatherResponse(
      {Coord? coord,
      List<Weather>? weather,
      String? base,
      Main? main,
      int? visibility,
      Wind? wind,
      Clouds? clouds,
      int? dt,
      Sys? sys,
      int? timezone,
      int? id,
      String? name,
      int? cod}) {
    if (coord != null) {
      _coord = coord;
    }
    if (weather != null) {
      _weather = weather;
    }
    if (base != null) {
      _base = base;
    }
    if (main != null) {
      _main = main;
    }
    if (visibility != null) {
      _visibility = visibility;
    }
    if (wind != null) {
      _wind = wind;
    }
    if (clouds != null) {
      _clouds = clouds;
    }
    if (dt != null) {
      _dt = dt;
    }
    if (sys != null) {
      _sys = sys;
    }
    if (timezone != null) {
      _timezone = timezone;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (cod != null) {
      _cod = cod;
    }
  }

  Coord? get coord => _coord;
  List<Weather>? get weather => _weather;
  String? get base => _base;
  Main? get main => _main;
  int? get visibility => _visibility;
  Wind? get wind => _wind;
  Clouds? get clouds => _clouds;
  int? get dt => _dt;
  Sys? get sys => _sys;
  int? get timezone => _timezone;
  int? get id => _id;
  String? get name => _name;
  int? get cod => _cod;

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_coord != null) {
      data['coord'] = _coord!.toJson();
    }
    if (_weather != null) {
      data['weather'] = _weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = _base;
    if (_main != null) {
      data['main'] = _main!.toJson();
    }
    data['visibility'] = _visibility;
    if (_wind != null) {
      data['wind'] = _wind!.toJson();
    }
    if (_clouds != null) {
      data['clouds'] = _clouds!.toJson();
    }
    data['dt'] = _dt;
    if (_sys != null) {
      data['sys'] = _sys!.toJson();
    }
    data['timezone'] = _timezone;
    data['id'] = _id;
    data['name'] = _name;
    data['cod'] = _cod;
    return data;
  }
}

class Coord {
  dynamic _lon;
  dynamic _lat;

  Coord({int? lon, int? lat}) {
    if (lon != null) {
      _lon = lon;
    }
    if (lat != null) {
      _lat = lat;
    }
  }

  int? get lon => _lon;
  set lon(int? lon) => _lon = lon;
  int? get lat => _lat;
  set lat(int? lat) => _lat = lat;

  Coord.fromJson(Map<String, dynamic> json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = _lon;
    data['lat'] = _lat;
    return data;
  }
}

class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  Weather({int? id, String? main, String? description, String? icon}) {
    if (id != null) {
      _id = id;
    }
    if (main != null) {
      _main = main;
    }
    if (description != null) {
      _description = description;
    }
    if (icon != null) {
      _icon = icon;
    }
  }

  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Weather.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['main'] = _main;
    data['description'] = _description;
    data['icon'] = _icon;
    return data;
  }
}

class Main {
  dynamic _temp;
  dynamic _feelsLike;
  dynamic _tempMin;
  dynamic _tempMax;
  int? _pressure;
  int? _humidity;

  Main(
      {dynamic temp,
      dynamic feelsLike,
      dynamic tempMin,
      dynamic? tempMax,
      int? pressure,
      int? humidity}) {
    if (temp != null) {
      _temp = temp;
    }
    if (feelsLike != null) {
      _feelsLike = feelsLike;
    }
    if (tempMin != null) {
      _tempMin = tempMin;
    }
    if (tempMax != null) {
      _tempMax = tempMax;
    }
    if (pressure != null) {
      _pressure = pressure;
    }
    if (humidity != null) {
      _humidity = humidity;
    }
  }

  dynamic get temp => _temp;
  dynamic get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get humidity => _humidity;

  Main.fromJson(Map<String, dynamic> json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = _temp;
    data['feels_like'] = _feelsLike;
    data['temp_min'] = _tempMin;
    data['temp_max'] = _tempMax;
    data['pressure'] = _pressure;
    data['humidity'] = _humidity;
    return data;
  }
}

class Wind {
  dynamic _speed;
  int? _deg;
  double? _gust;

  Wind({required double? speed, int? deg, double? gust}) {
    if (speed != null) {
      _speed = speed;
    }
    if (deg != null) {
      _deg = deg;
    }
    if (gust != null) {
      _gust = gust;
    }
  }

  dynamic get speed => _speed;
  int? get deg => _deg;
  double? get gust => _gust;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = _speed;
    data['deg'] = _deg;
    data['gust'] = _gust;
    return data;
  }
}

class Clouds {
  int? _all;

  Clouds({int? all}) {
    if (all != null) {
      _all = all;
    }
  }

  int? get all => _all;

  Clouds.fromJson(Map<String, dynamic> json) {
    _all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = _all;
    return data;
  }
}

class Sys {
  int? _type;
  int? _id;
  String? _country;
  int? _sunrise;
  int? _sunset;

  Sys({int? type, int? id, String? country, int? sunrise, int? sunset}) {
    if (type != null) {
      _type = type;
    }
    if (id != null) {
      _id = id;
    }
    if (country != null) {
      _country = country;
    }
    if (sunrise != null) {
      _sunrise = sunrise;
    }
    if (sunset != null) {
      _sunset = sunset;
    }
  }

  int? get type => _type;
  int? get id => _id;
  String? get country => _country;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['id'] = _id;
    data['country'] = _country;
    data['sunrise'] = _sunrise;
    data['sunset'] = _sunset;
    return data;
  }
}
