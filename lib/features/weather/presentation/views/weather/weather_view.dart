import 'package:cached_network_image/cached_network_image.dart';
import 'package:calculator_flutter_app/common/extensions/capitalize_string.dart';
import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/extensions/temperature_conversion.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/features/weather/presentation/providers/get_current_weather_provider.dart';
import 'package:calculator_flutter_app/features/weather/presentation/providers/user_current_location_provider.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/consts/api.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class WeatherView extends ConsumerStatefulWidget {
  const WeatherView({super.key});

  @override
  ConsumerState<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends ConsumerState<WeatherView> {
  getCurrentWeather() async {
    try {
      await ref.read(getCurrentWeatherProvider.future);
    } catch (e) {
      showToast(msg: 'Something went wrong $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(userCurrentLocationProvider);

    return Column(
      children: [
        InkWell(
          onTap: getCurrentWeather,
          child: const Center(
            child: AppText(
              text: 'Weather Update',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        32.hb,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer(builder: (context, ref, _) {
                    final weatherAsync = ref.watch(getCurrentWeatherProvider);

                    if (!weatherAsync.hasValue) {
                      return Shimmer.fromColors(
                        highlightColor: Colors.grey.shade100,
                        baseColor: Colors.grey.shade300,
                        child: Container(
                          height: 96.h,
                          width: 330.w,
                          decoration: BoxDecoration(
                            color: R.colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.r),
                            ),
                          ),
                        ),
                      );
                    }

                    final weather = weatherAsync.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 96.h,
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              colors: [
                                R.colors.primary,
                                R.colors.primary,
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '${Apis.weatherIcon}/${weather!.icon}.png',
                              ),
                              12.wb,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 164.w,
                                    child: AppText(
                                      text: location?.address ?? 'Your place',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: R.colors.white,
                                      letterSpacing: 0.08,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  4.hb,
                                  AppText(
                                    text: weather.description.capitalize,
                                    fontSize: 16,
                                    color: R.colors.white,
                                    letterSpacing: 0.08,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              AppText(
                                text: weather.temperature.toCelsius(),
                                color: R.colors.white,
                                fontSize: 36,
                              ),
                            ],
                          ),
                        ),
                        24.hb,
                        const AppText(
                          text: 'Details',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        12.hb,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 52.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55.r),
                                color: R.colors.greyTextField,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.svgs.humidityIcon.svg(
                                    height: 22.r,
                                    width: 22.r,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: '${weather.humidity}%',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: 'Humidity',
                                    fontSize: 12,
                                    color: R.colors.secondary.withOpacity(0.5),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 52.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55.r),
                                color: R.colors.greyTextField,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.svgs.temperatureIcon.svg(
                                    height: 22.r,
                                    width: 22.r,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: weather.temperature.toCelsius(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: 'Celsius',
                                    fontSize: 12,
                                    color: R.colors.secondary.withOpacity(0.5),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        14.hb,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 52.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55.r),
                                color: R.colors.greyTextField,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.svgs.pressureIcon.svg(
                                    height: 22.r,
                                    width: 22.r,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: '${weather.pressure}',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: 'Pressure',
                                    fontSize: 12,
                                    color: R.colors.secondary.withOpacity(0.5),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 52.h,
                              width: 161.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(55.r),
                                color: R.colors.greyTextField,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.svgs.sunIcon.svg(
                                    height: 22.r,
                                    width: 22.r,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: weather.uvIndex.toString(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  5.wb,
                                  AppText(
                                    text: 'UI Index',
                                    fontSize: 12,
                                    color: R.colors.secondary.withOpacity(0.5),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
