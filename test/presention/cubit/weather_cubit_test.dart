import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/data/repositories/wether_repo_imp.dart';
import 'package:weather_app/presention/cubit/weather_cubit.dart';

class MockRepo extends Mock implements WetherRepoImp {}

void main() {
  late MockRepo mockRepo;
  late WeatherCubit cubit;

  setUp(() {
    mockRepo = MockRepo();
    cubit = WeatherCubit(mockRepo);
  });
  tearDown(() {
    cubit.close();
  });

  group(
    'WeatherCubit',
    () {
      test(
        "the Initial state for weather cubit is WeatherCubitInitial",
        () {

          // there is a problem i  found here and i searched and i will search again
          // if u got this msg that's mean i can't find solution before the time to end 
          bool x = WeatherCubitInitial is WeatherCubitState;
          print(x);
          expect(cubit.state, weatherCubitInitial);
        },
      );

      //   test("checkInternetConnectionState  it done correctly ", () async{
      //     cubit.isConnected = true;
      //  await   expectLater(cubit.state, [weatherCubitInitial,internetConnectionISon]);
      //   });

      blocTest<WeatherCubit, WeatherCubitState>(
        'emits [MyState] when MyEvent is added.',
        build: () => cubit,
        act: (bloc)=> cubit,
        expect: () => <WeatherCubitState>[],
      );
    },
  );
}
const weatherCubitState = TypeMatcher<WeatherCubitState>();
const weatherCubitInitial = TypeMatcher<WeatherCubitInitial>();

const askGps = TypeMatcher<AskGps>();
const gpsISoff = TypeMatcher<GpsISoff>();
const gpsISOn = TypeMatcher<GpsISOn>();

const askLocationPermission = TypeMatcher<AskLocationPermission>();
const succeedLocationPermission = TypeMatcher<SucceedLocationPermission>();
const felidLocationPermission = TypeMatcher<FelidLocationPermission>();

const loadingCurrentLocationPosition =
    TypeMatcher<LoadingCurrentLocationPosition>();
const succeedGetCurrentLocationPosition =
    TypeMatcher<SucceedGetCurrentLocationPosition>();
const felidGetCurrentLocationPosition =
    TypeMatcher<FelidGetCurrentLocationPosition>();

const internetConnectionISoff = TypeMatcher<InternetConnectionISoff>();
const internetConnectionISon = TypeMatcher<InternetConnectionISon>();


const loadingWeatherInfoForCountries =
    TypeMatcher<LoadingWeatherInfoForCountries>();
const succeedLoadedWeatherInfoForCountries =
    TypeMatcher<SucceedLoadedWeatherInfoForCountries>();
const felidLoadedWeatherInfoForCountries =
    TypeMatcher<FelidLoadedWeatherInfoForCountries>();

const typingCountriesName = TypeMatcher<TypingCountriesName>();
const succeedValidateCountries = TypeMatcher<SucceedValidateCountries>();
const felidValidateCountries = TypeMatcher<FelidValidateCountries>();

const loadingCurrentLocationWeatherInfo =
    TypeMatcher<LoadingCurrentLocationWeather>();
const succeedLoadedCurrentLocationWeatherInfo =
    TypeMatcher<SucceedLoadedCurrentLocationWeather>();
const felidLoadedCurrentLocationWeatherInfo =
    TypeMatcher<FelidLoadedCurrentLocationWeather>();
