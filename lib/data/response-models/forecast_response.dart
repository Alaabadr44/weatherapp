class ForecastResponse {
  String? _cod;
  int? _message;
  int? _cnt;
  List<ListWeatherIn3HoursPeriod>? _list;
  City? _city;

  ForecastResponse(
      {String? cod,
      int? message,
      int? cnt,
      List<ListWeatherIn3HoursPeriod>? list,
      City? city}) {
    if (cod != null) {
      _cod = cod;
    }
    if (message != null) {
      _message = message;
    }
    if (cnt != null) {
      _cnt = cnt;
    }
    if (list != null) {
      _list = list;
    }
    if (city != null) {
      _city = city;
    }
  }

  String? get cod => _cod;
  int? get message => _message;
  int? get cnt => _cnt;
  List<ListWeatherIn3HoursPeriod>? get list => _list;
  City? get city => _city;

  ForecastResponse.fromJson(Map<String, dynamic> json) {
    _cod = json['cod'].toString();
    _message = json['message'];
    _cnt = json['cnt'];
    if (json['list'] != null) {
      _list = <ListWeatherIn3HoursPeriod>[];
      json['list'].forEach((v) {
        _list!.add(ListWeatherIn3HoursPeriod.fromJson(v));
      });
    }
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = _cod;
    data['message'] = _message;
    data['cnt'] = _cnt;
    if (_list != null) {
      data['list'] = _list!.map((v) => v.toJson()).toList();
    }
    if (_city != null) {
      data['city'] = _city!.toJson();
    }
    return data;
  }
}

class ListWeatherIn3HoursPeriod {
  int? _dt;
  Main? _main;
  List<Weather>? _weather;
  Clouds? _clouds;
  Wind? _wind;
  int? _visibility;
  double? _pop;
  Sys? _sys;
  String? _dtTxt;
  Rain? _rain;

  ListWeatherIn3HoursPeriod(
      {int? dt,
      Main? main,
      List<Weather>? weather,
      Clouds? clouds,
      Wind? wind,
      int? visibility,
      double? pop,
      Sys? sys,
      String? dtTxt,
      Rain? rain}) {
    if (dt != null) {
      _dt = dt;
    }
    if (main != null) {
      _main = main;
    }
    if (weather != null) {
      _weather = weather;
    }
    if (clouds != null) {
      _clouds = clouds;
    }
    if (wind != null) {
      _wind = wind;
    }
    if (visibility != null) {
      _visibility = visibility;
    }
    if (pop != null) {
      _pop = pop;
    }
    if (sys != null) {
      _sys = sys;
    }
    if (dtTxt != null) {
      _dtTxt = dtTxt;
    }
    if (rain != null) {
      _rain = rain;
    }
  }

  int? get dt => _dt;

  Main? get main => _main;
  List<Weather>? get weather => _weather;
  Clouds? get clouds => _clouds;
  Wind? get wind => _wind;
  int? get visibility => _visibility;
  double? get pop => _pop;
  Sys? get sys => _sys;
  String? get dtTxt => _dtTxt;
  Rain? get rain => _rain;

  ListWeatherIn3HoursPeriod.fromJson(Map<String, dynamic> json) {
    _dt = json['dt'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _visibility = json['visibility'];
    _pop = double.parse(json['pop'].toString());
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _dtTxt = json['dt_txt'];
    _rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = _dt;
    if (_main != null) {
      data['main'] = _main!.toJson();
    }
    if (_weather != null) {
      data['weather'] = _weather!.map((v) => v.toJson()).toList();
    }
    if (_clouds != null) {
      data['clouds'] = _clouds!.toJson();
    }
    if (_wind != null) {
      data['wind'] = _wind!.toJson();
    }
    data['visibility'] = _visibility;
    data['pop'] = _pop;
    if (_sys != null) {
      data['sys'] = _sys!.toJson();
    }
    data['dt_txt'] = _dtTxt;
    if (_rain != null) {
      data['rain'] = _rain!.toJson();
    }
    return data;
  }
}

class Main {
  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _seaLevel;
  int? _grndLevel;
  int? _humidity;
  double? _tempKf;

  Main(
      {double? temp,
      double? feelsLike,
      double? tempMin,
      double? tempMax,
      int? pressure,
      int? seaLevel,
      int? grndLevel,
      int? humidity,
      double? tempKf}) {
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
    if (seaLevel != null) {
      _seaLevel = seaLevel;
    }
    if (grndLevel != null) {
      _grndLevel = grndLevel;
    }
    if (humidity != null) {
      _humidity = humidity;
    }
    if (tempKf != null) {
      _tempKf = tempKf;
    }
  }

  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get seaLevel => _seaLevel;
  int? get grndLevel => _grndLevel;
  int? get humidity => _humidity;
  double? get tempKf => _tempKf;

  Main.fromJson(Map<String, dynamic> json) {
    _temp = double.parse(json['temp'].toString());
    _feelsLike = double.parse(json['feels_like'].toString());
    _tempMin = double.parse(json['temp_min'].toString());
    _tempMax =double.parse(json['temp_max'].toString());
    _pressure = json['pressure'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
    _humidity = json['humidity'];
    _tempKf = double.parse(json['temp_kf'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = _temp;
    data['feels_like'] = _feelsLike;
    data['temp_min'] = _tempMin;
    data['temp_max'] = _tempMax;
    data['pressure'] = _pressure;
    data['sea_level'] = _seaLevel;
    data['grnd_level'] = _grndLevel;
    data['humidity'] = _humidity;
    data['temp_kf'] = _tempKf;
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

class Wind {
  double? _speed;
  int? _deg;
  double? _gust;

  Wind({double? speed, int? deg, double? gust}) {
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

  double? get speed => _speed;
  int? get deg => _deg;
  double? get gust => _gust;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed =double.parse(json['speed'].toString());
    _deg = json['deg'];
    _gust = double.parse(json['gust'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = _speed;
    data['deg'] = _deg;
    data['gust'] = _gust;
    return data;
  }
}

class Sys {
  String? _pod;

  Sys({String? pod}) {
    if (pod != null) {
      _pod = pod;
    }
  }

  String? get pod => _pod;

  Sys.fromJson(Map<String, dynamic> json) {
    _pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = _pod;
    return data;
  }
}

class Rain {
  double? _d3h;

  Rain({double? d3h}) {
    if (d3h != null) {
      _d3h = d3h;
    }
  }

  double? get d3h => _d3h;

  Rain.fromJson(Map<String, dynamic> json) {
    _d3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = _d3h;
    return data;
  }
}

class City {
  int? _id;
  String? _name;
  Coord? _coord;
  String? _country;
  int? _population;
  int? _timezone;
  int? _sunrise;
  int? _sunset;

  City(
      {int? id,
      String? name,
      Coord? coord,
      String? country,
      int? population,
      int? timezone,
      int? sunrise,
      int? sunset}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (coord != null) {
      _coord = coord;
    }
    if (country != null) {
      _country = country;
    }
    if (population != null) {
      _population = population;
    }
    if (timezone != null) {
      _timezone = timezone;
    }
    if (sunrise != null) {
      _sunrise = sunrise;
    }
    if (sunset != null) {
      _sunset = sunset;
    }
  }

  int? get id => _id;
  String? get name => _name;
  Coord? get coord => _coord;
  String? get country => _country;
  int? get population => _population;
  int? get timezone => _timezone;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  City.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    _country = json['country'];
    _population = json['population'];
    _timezone = json['timezone'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    if (_coord != null) {
      data['coord'] = _coord!.toJson();
    }
    data['country'] = _country;
    data['population'] = _population;
    data['timezone'] = _timezone;
    data['sunrise'] = _sunrise;
    data['sunset'] = _sunset;
    return data;
  }
}

class Coord {
  int? _lat;
  int? _lon;

  Coord({int? lat, int? lon}) {
    if (lat != null) {
      _lat = lat;
    }
    if (lon != null) {
      _lon = lon;
    }
  }

  int? get lat => _lat;
  int? get lon => _lon;

  Coord.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'].toInt();
    _lon = json['lon'].toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = _lat;
    data['lon'] = _lon;
    return data;
  }
}
