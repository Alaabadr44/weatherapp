import 'dart:convert';

import 'package:equatable/equatable.dart';

// for cites page
class WeatherAppModel extends Temperature with EquatableMixin {
  late String? _description;
  late double? _windSpeed;
  late String? _cityName;
  late String? _icon;

  late DateTime? _data;

  WeatherAppModel({
    double? minTemperature,
    double? maxTemperature,
    String? description,
    dynamic windSpeed,
    String? cityName,
    String? icon,
    String? data,
  }) : super(max: maxTemperature, min: minTemperature) {
    _description = description;
    _windSpeed = double.parse(windSpeed.toString());

    _cityName = cityName;
    icon = "https://openweathermap.org/img/wn/${icon}@2x.png";
    _icon = icon;

    _data = data != null ? DateTime.parse(data) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      'description': _description.toString(),
      'windSpeed': _windSpeed.toString(),
      'cityName': _cityName.toString(),
      'icon': _icon.toString(),
      'date': _data != null ? _data!.toIso8601String() : "",
    };
  }

  String? get description => _description;
  double? get windSpeed => _windSpeed;
  String? get cityName => _cityName;
  set cityName( String? cityName) => _cityName = cityName;
  String? get icon => _icon;
  DateTime? get data => _data;

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        description,
        windSpeed,
        super.max,
        super.min,
      ];

  @override
  bool? get stringify => true;

  factory WeatherAppModel.fromMap(Map<String, dynamic> map) {
    return WeatherAppModel(
      description: map["weather"][0]['description'],
      // edit
      windSpeed: double.parse(map['wind']['speed'].toString()),
      cityName: map['name'],
      icon: map['weather'][0]['icon'],
      maxTemperature: map['main']['temp_max'],
      minTemperature: double.parse(map['main']['temp_min'].toString()),
      data: map['dt_txt'],
    );
  }

  factory WeatherAppModel.fromJson(String source) =>
      WeatherAppModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherAppModel(_description: $_description, _windSpeed: $_windSpeed, _cityName: $_cityName, _icon: $_icon)';
  }
}

class Temperature {
  late double _min;
  late double _max;
  Temperature({
    required min,
    required max,
  }) {
    _min = double.parse(min.toString());
    _max = double.parse(max.toString());
  }
  double? get max => _max;
  double? get min => _min;
}
