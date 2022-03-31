import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../domain/model/weather_model.dart';
import '../../data/repositories/wether_repo_imp.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  final WetherRepoImp _repository;
  WeatherCubit(this._repository) : super(const WeatherCubitInitial());

  void onInit() {
    checkInternetConnectionState();
    requestLocationPermission();
    requestGpsOpenState();
    getCurrentPosition();
  }

  static get(context) => BlocProvider.of<WeatherCubit>(context);

// checkInternetConnectionState
  late bool isInternetConnection;
  checkInternetConnectionState() async {
    isInternetConnection = await InternetConnectionChecker().hasConnection;
    if (isInternetConnection) {
      emit(InternetConnectionISon());
    } else {
      emit(InternetConnectionISoff());
    }
  }

  // checkLocationPermission is Accepted
  late bool isLocationPermission;
  late LocationPermission permission;
  checkLocationPermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.deniedForever) {
      isLocationPermission = false;
      emit(FelidLocationPermission());
    } else {
      isLocationPermission = true;
      emit(SucceedLocationPermission());
      getCurrentPosition();
    }
  }

  requestLocationPermission() async {
    await checkLocationPermission();

    if (!isLocationPermission) {
      emit(AskLocationPermission());
      permission = await Geolocator.requestPermission();
    }
    await checkLocationPermission();
  }

  late bool isGps;
  checkGpsState() async {
    isGps = await Geolocator.isLocationServiceEnabled();
    if (isGps) {
      emit(GpsISOn());
    } else {
      emit(GpsISoff());
    }
  }

  requestGpsOpenState() async {
    await checkGpsState();
    if (!isGps) {
      emit(AskGps());
      await Geolocator.openLocationSettings();
    }
    await checkGpsState();
    getCurrentPosition();
  }

  late Position position;
  getCurrentPosition() async {
    emit(LoadingCurrentLocationPosition());
    position = await Geolocator.getCurrentPosition();
    if (position.toString().isNotEmpty) {
      emit(SucceedGetCurrentLocationPosition());
    } else {
      emit(FelidGetCurrentLocationPosition());
    }
  }

  bool isSearchFieldFocus = false;
  void onSearchFieldTap() {
    if (isSearchFieldFocus) {
      isSearchFieldFocus = false;
      emit(TextFelidFocusOff());
    } else {
      isSearchFieldFocus = true;
      emit(TextFelidFocusOn());
    }
  }

  late List<String> cities;
  bool isSearchFelidNotEmpty = false;
  bool isCitesValidate = false;
  void checkCitesValidate(String? value, bool run) {
    if (value != null && value.isNotEmpty) {
      isSearchFelidNotEmpty = true;
      emit(TypingCountriesName());
    } else {
      isSearchFelidNotEmpty = false;
      emit(ClearTextFelid());
    }

    if (run) {
      if (value!.contains(',')) {
        value = value.trim();
        // if write by mistake , in first
        if (value.startsWith(',')) {
          value = value.substring(1);
        }
        if (!value.endsWith(',')) {
          value = value + ',';
        }
        var cityInputCount = ','.allMatches(value).length;
        var isCountMore7 = cityInputCount <= 7;
        var isCountless3 = cityInputCount >= 3;
        if (isCountMore7 && isCountless3) {
          cities = [];
          for (var i = 0; i < cityInputCount; i++) {
            var city = value.split(',')[i].trim();
            cities.add(city);
          }
          // print(" cites " + cities.toString());
          isCitesValidate = true;
          emit(SucceedValidateCountries());
        } else if (!isCountless3) {
          isCitesValidate = false;
          emit(const FelidValidateCountries(errorMsg: " less than 3 country "));
        } else if (!isCountMore7) {
          isCitesValidate = false;
          emit(const FelidValidateCountries(errorMsg: "more than 7 "));
        }
      } else {
        isCitesValidate = false;
        emit(const FelidValidateCountries(
            errorMsg: "Please separate cities by ( , ) "));
      }
    } else {
      emit(RefreshState());
    }
  }

  void clearSearchData() {
    cities.clear();
    citesWeatherInfo.clear();
    isSearchFelidNotEmpty = false;
    isSearchFieldFocus = false;
    emit(ClearSearchData());
  }

  List<WeatherAppModel> citesWeatherInfo = [];
  void getListWeatherInfo() {
    if (citesWeatherInfo.isNotEmpty) {
      citesWeatherInfo.clear();
    }
    if (isInternetConnection && isCitesValidate) {
      emit(LoadingWeatherInfoForCountries());

      _repository.fetchListOfCountriesWeatherInfo(countries: cities).then(
            (value) => value.fold(
              (l) {
                emit(const FelidLoadedWeatherInfoForCountries(
                    errorMsg: "Can't Get information from internet "));
              },
              (response) {
                // print(response.map((e) => e.name.toString()));
                response
                    .map((item) => citesWeatherInfo
                        .add(WeatherAppModel.fromMap(item.toJson())))
                    .toList();

                emit(SucceedLoadedWeatherInfoForCountries(
                    countriesWeather: citesWeatherInfo));
              },
            ),
          );
    } else {
      emit(const FelidLoadedWeatherInfoForCountries(
          errorMsg: "loading felid ....  "));
    }
  }

  List<String> possibleExpectedDays = [];
  List<WeatherAppModel> allExpectedWeather = [];
  void getExpectedWeatherDataIn5days() {
    if (isLocationPermission && isInternetConnection && isGps) {
      emit(LoadingCurrentLocationWeather());
      if (position.toString().isNotEmpty) {
        _repository
            .fetchCurrentLocationWeather(
                lat: position.latitude.toString(),
                long: position.longitude.toString())
            .then((value) {
          value.fold(
            (l) => emit(const FelidLoadedCurrentLocationWeather(
                errorMsg: "felid load ExpectedWeather ")),
            (response) {
              response.list?.map((weather) {
                allExpectedWeather
                    .add(WeatherAppModel.fromMap(weather.toJson()));
              }).toList();
              allExpectedWeather
                  .map((e) => e.cityName = response.city!.name)
                  .toList();
              emit(SucceedLoadedCurrentLocationWeather());
              possibleExpectedDays = allExpectedWeather
                  .map((e) => e.data.toString().split(" ")[0])
                  .toSet()
                  .toList();
              selectedDey = possibleExpectedDays.first;
              // print(" sss " + selectedDey);
              choseForecastWeatherInfoIn(selectedDey);
            },
          );
        });
      } else {
        const FelidLoadedCurrentLocationWeather(
            errorMsg: "failed to get your location ");
      }
    }
  }

  List<WeatherAppModel?> selectedWeatherInByDay = [];
  String selectedDey = "";
  void choseForecastWeatherInfoIn(String indexDay) {
    selectedDey = indexDay;
    if (allExpectedWeather.isNotEmpty) {
      emit(LoadedSelectDayInForecastWeatherInfo());
      selectedWeatherInByDay = allExpectedWeather
          .map((e) {
            var day = e.data.toString().split(" ")[0];
            if (day == indexDay) {
              return e;
            }
          })
          .toSet()
          .toList();
      selectedWeatherInByDay.remove(null);

      emit(SucceedSelectDayInForecastWeatherInfo(
          cities: selectedWeatherInByDay));
    }
  }

  void clearCurrentWeatherData() {
    possibleExpectedDays = [];
    allExpectedWeather = [];
    possibleExpectedDays = [];
    emit(ClearCurrentWeatherData());
  }

 
}
