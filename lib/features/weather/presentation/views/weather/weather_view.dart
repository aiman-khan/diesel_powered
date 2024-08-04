import 'package:cached_network_image/cached_network_image.dart';
import 'package:diesel_powered/common/extensions/capitalize_string.dart';
import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/extensions/temperature_conversion.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/features/google_maps/domain/models/location/location_model.dart';
import 'package:diesel_powered/features/google_maps/presentation/providers/request_location_permission_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
import 'package:diesel_powered/features/weather/presentation/providers/get_current_weather_provider.dart';
import 'package:diesel_powered/features/weather/presentation/providers/user_current_location_provider.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/consts/api.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shimmer/shimmer.dart';

class WeatherView extends ConsumerStatefulWidget {
  const WeatherView({super.key});

  @override
  ConsumerState<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends ConsumerState<WeatherView> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> _requestLocationPermission() async {
    try {
      await ref.read(requestLocationPermissionProvider.future);

      return;
    } on MessageException catch (e) {
      showToast(msg: e.message);
      return;
    } on LocationPermissionDenied {
      showToast(msg: 'Location Permission is denied');
      return;
    } on LocationPermissionDeniedPermanently {
      if (mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => const Dialog(
            child: RequestPermissionWidget(
              icon: Icons.location_on,
              description:
                  'Allow app to access you location while you use the app',
            ),
          ),
        );
      }
      return;
    } catch (e) {
      showToast(msg: 'Something went wrong');
    }
    return;
  }

  Future<void> getCurrentLocation() async {
    _requestLocationPermission();
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    final location = LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      address: "${place.administrativeArea}, ${place.country}",
    );

    ref.read(userCurrentLocationProvider.notifier).state = location;
  }

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
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
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
                              16.wb,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text: location?.address ?? 'Your place',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: R.colors.white,
                                    letterSpacing: 0.08,
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
