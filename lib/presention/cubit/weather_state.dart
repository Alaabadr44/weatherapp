part of 'weather_cubit.dart';

abstract class WeatherCubitState extends Equatable {
  const WeatherCubitState();

  @override
  List<Object> get props => [
        WeatherCubitState,
      ];

  @override
  bool get stringify => true;
}

class WeatherCubitInitial extends WeatherCubitState implements Equatable {
  const WeatherCubitInitial();
}

// for handel LocationPermission
class AskLocationPermission extends WeatherCubitState {}

class SucceedLocationPermission extends WeatherCubitState {}

class FelidLocationPermission extends WeatherCubitState {}

// gps Status
class GpsISoff extends WeatherCubitState {}

class AskGps extends WeatherCubitState {}

class GpsISOn extends WeatherCubitState {}

// get current LocationPosition
// get     LoadingCurrentLocationPosition
class LoadingCurrentLocationPosition extends WeatherCubitState {}

class SucceedGetCurrentLocationPosition extends WeatherCubitState {}

class FelidGetCurrentLocationPosition extends WeatherCubitState {}

// Internet check
class InternetConnectionISoff extends WeatherCubitState {}

class InternetConnectionISon extends WeatherCubitState {}

class LoadedSelectDayInForecastWeatherInfo extends WeatherCubitState {}

class SucceedSelectDayInForecastWeatherInfo extends WeatherCubitState {
  final List<WeatherAppModel?> cities;
  const SucceedSelectDayInForecastWeatherInfo({
    required this.cities,
  });
}

//  fetchListOfCountriesWeatherInfo
class LoadingWeatherInfoForCountries extends WeatherCubitState {}

class SucceedLoadedWeatherInfoForCountries extends WeatherCubitState {
  final List<WeatherAppModel> countriesWeather;
  const SucceedLoadedWeatherInfoForCountries({
    required this.countriesWeather,
  });
}

class FelidLoadedWeatherInfoForCountries extends WeatherCubitState {
  final String errorMsg;
  const FelidLoadedWeatherInfoForCountries({
    required this.errorMsg,
  });
}

class ClearSearchData extends WeatherCubitState {}

//-- when write Countries names
class TypingCountriesName extends WeatherCubitState {}

class ClearTextFelid extends WeatherCubitState {}

class SucceedValidateCountries extends WeatherCubitState {}

class FelidValidateCountries extends WeatherCubitState {
  final String errorMsg;
  const FelidValidateCountries({
    required this.errorMsg,
  });
}

// fetchCurrentLocationWeatherInfo
class LoadingCurrentLocationWeather extends WeatherCubitState {}

class SucceedLoadedCurrentLocationWeather extends WeatherCubitState {}

class FelidLoadedCurrentLocationWeather extends WeatherCubitState {
  final String errorMsg;
  const FelidLoadedCurrentLocationWeather({
    required this.errorMsg,
  });
}

// has forces
class TextFelidFocusOn extends WeatherCubitState {}

class TextFelidFocusOff extends WeatherCubitState {}

//clear current weatherData

class ClearCurrentWeatherData extends WeatherCubitState {}

class RefreshState extends WeatherCubitState{}
