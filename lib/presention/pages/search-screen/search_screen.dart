import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/service/show_tost.dart';
import '../../cubit/weather_cubit.dart';
import '../../theme/colors.dart';
import 'widgets/search_result_card_item.dart';
import 'widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/SearchScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Search for city",
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        bottom: PreferredSize(
          child: const SearchTextField(),
          preferredSize: Size.fromHeight(70.h),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          BlocConsumer<WeatherCubit, WeatherCubitState>(
            listener: (context, state) {
              if (state is FelidLoadedWeatherInfoForCountries) {
                showToast(state.errorMsg, context);
              } else if (state is FelidValidateCountries) {
                showToast(state.errorMsg, context);
              }
            },
            builder: (context, state) {
              if (state is SucceedLoadedWeatherInfoForCountries) {
                WeatherCubit cubit = WeatherCubit.get(context);

                return SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                      padding: EdgeInsetsDirectional.only(start: 10.w),
                      itemCount: cubit.citesWeatherInfo.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 20.w);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return SearchResultCardItem(
                          cityName:
                              cubit.citesWeatherInfo[index].cityName ?? "",
                          iconUrl:
                              cubit.citesWeatherInfo[index].icon.toString(),
                          disc: cubit.citesWeatherInfo[index].description!,
                          maxTemp: cubit.citesWeatherInfo[index].max!
                              .toInt()
                              .toString(),
                          minTemp: cubit.citesWeatherInfo[index].min!
                              .toInt()
                              .toString(),
                          windSpeed: cubit.citesWeatherInfo[index].windSpeed!
                              .toInt()
                              .toString(),
                        );
                      },
                    ));
              } else if (state is TypingCountriesName ||
                  state is LoadingWeatherInfoForCountries) {
                return const Center(
                    child: CircularProgressIndicator(color: kYellow));
              } else {
                return Center(child: Container());
              }
            },
          ),
        ],
      ),
    );
  }
}



// tried but i have no able to more customize design so its fail for me
class SearchCities extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black,
      ),
    );
  }
}
