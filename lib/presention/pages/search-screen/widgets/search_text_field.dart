// search_text_field
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/weather_cubit.dart';
import '../../../theme/colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherCubitState>(
      builder: (context, state) {
        WeatherCubit cubit = WeatherCubit.get(context);
        return Center(
          child: Container(
            height: 70.h,
            width: 350.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(25.r),
                  right: Radius.circular(25.r),
                ),
                color: Colors.black,
                border: Border.all(
                  color: cubit.isSearchFieldFocus ? kYellow : Colors.black,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    blurStyle: BlurStyle.solid,
                    blurRadius: 2,
                    color: kYellow,
                  )
                ]),
            child: TextField(
              decoration: InputDecoration(
                // hintText:
                //     "ex: paris,london,cairo You should press + every new city",
                hintText: "ex: paris,london,cairo,",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                suffixIcon: Visibility(
                  visible: cubit.isSearchFelidNotEmpty,
                  child: SizedBox(
                    height: 10.h,
                    width: 10.w,
                    child: IconButton(
                      onPressed: () {
                        searchController.clear();
                        cubit.isSearchFelidNotEmpty = false;
                        cubit.cities = [];

                        cubit.clearSearchData();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    cubit.onSearchFieldTap();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                fillColor: const Color(0xff1F1F21).withOpacity(0.8),
                filled: true,

                border: OutlineInputBorder(
                  gapPadding: 10,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25.r),
                    right: Radius.circular(25.r),
                  ),
                  borderSide: const BorderSide(
                    color: kYellow,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25.r),
                    right: Radius.circular(25.r),
                  ),
                  borderSide: const BorderSide(
                    color: kYellow,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25.r),
                    right: Radius.circular(25.r),
                  ),
                  borderSide: const BorderSide(
                    color: kYellow,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(25.r),
                    right: Radius.circular(25.r),
                  ),
                ),
              ),
              cursorColor: kYellow,
              autofocus: false,
              controller: searchController,
              enabled: true,
              keyboardType: TextInputType.name,
              maxLines: 1,
              minLines: 1,
              onTap: cubit.onSearchFieldTap,
              onChanged: (String? x) {
                cubit.checkCitesValidate(x, false);
              },
              onSubmitted: (String? value) {
                cubit.onSearchFieldTap();
                cubit.checkCitesValidate(value,true);
                cubit.getListWeatherInfo();
              },
              smartDashesType: SmartDashesType.enabled,
              readOnly: false,
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
              textInputAction: TextInputAction.done,
            ),
          ),
        );
      },
    );
  }
}
