import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/utils/time_stamps.dart';
import '../../domain/interFace repositories/wether_repo.dart';
import '../response-models/forecast_response.dart';
import '../response-models/weather_response.dart';
import '../sources/api_source/api_endpoints.dart';
import '../sources/api_source/api_key.dart';
import '../sources/api_source/query.dart';

/// this just implementation of WeatherInterFaceRepository
/// because App must be  It is adjustable and each layer is separate from others
///  and can be reused in different software projects.
/// These are just the implementation of the basic steps found in the Interface Class
class WetherRepoImp implements WeatherInterFaceRepository {
  @override
  Future<Either<Exception, ForecastResponse>>
      fetchCurrentLocationWeather({
    required String lat,
    required String long,
  }) async {
    late ForecastResponse forecastResponse;
    try {
      var response = await Dio().get(baseUrl + EndPoints.forecast,
          queryParameters: {
            Query.token: apiKey,
            Query.latitude: lat,
            Query.longitude: long,
            Query.language: 'en',
            Query.units: "metric",
            Query.dateStep: allThreeHoursCountInFiveDays,
          },
          options: Options(receiveTimeout: 5000, sendTimeout: 5000));
      if (response.statusCode == 200) {
        forecastResponse = ForecastResponse.fromJson(response.data);
        // print(forecastResponse.city!.name.toString());
        return right(forecastResponse);
      } else {
        return left(
          Exception("something wrong probably "),
        );
      }
    } on Exception catch (e) {
      return left(
        Exception("something wrong probably " + e.toString()),
      );
    }
  }

  @override
  Future<Either<Exception, List<WeatherResponse>>>
      fetchListOfCountriesWeatherInfo({
    required List<String> countries,
  }) async {
    // the validate of countries words and length in controller cubit
    List<WeatherResponse> weatherResponseOfCities = [];
    late WeatherResponse weatherResponse;

    try {
      for (var country in countries) {
        var response = await Dio().get(baseUrl + EndPoints.weather,
            queryParameters: {
              Query.token: apiKey,
              Query.country: country,
              Query.language: 'en',
              Query.units: "metric"
            },
            options: Options(receiveTimeout: 5000, sendTimeout: 5000));
        if (response.statusCode == 200) {
          weatherResponse = WeatherResponse.fromJson(response.data);
          weatherResponseOfCities.add(weatherResponse);
        } else {
          left(
            Exception("something wrong probably "),
          );
        }
      }
      return right(weatherResponseOfCities);
    } on Exception catch (e) {
      return left(Exception("something wrong probably " + e.toString()));
    }
  }

}
