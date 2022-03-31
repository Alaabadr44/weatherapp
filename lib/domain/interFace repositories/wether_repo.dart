import 'package:dartz/dartz.dart';

/// These are just the basic Api call steps in the app
/// must be implementation in Data layer of App 
abstract class WeatherInterFaceRepository {
  Future<Either<Exception, List<dynamic>>> fetchListOfCountriesWeatherInfo(
      {required List<String> countries});

  Future<Either<Exception, dynamic>>
      fetchCurrentLocationWeather({
    required String lat,
    required String long,
  });
}
