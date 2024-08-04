import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/features/google_maps/domain/models/location/location_model.dart';
import 'package:diesel_powered/features/google_maps/presentation/providers/request_location_permission_provider.dart';
import 'package:diesel_powered/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
import 'package:diesel_powered/features/weather/presentation/providers/get_current_weather_provider.dart';
import 'package:diesel_powered/features/weather/presentation/providers/user_current_location_provider.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

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

    final location = LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      address: '',
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
    return Column(
      children: [
        InkWell(
          onTap: getCurrentWeather,
          child: const AppText(
            text: 'Weather Update',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        32.hb,
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  // Consumer(builder: (context, ref, _) {
                  //   final weatherAsync = ref.watch(getCurrentWeatherProvider);

                  //   if (!weatherAsync.hasValue) {
                  //     return CircularProgressIndicator();
                  //   }

                  //   final weather = weatherAsync.value;

                  //   return Container(
                  //     height: 96.h,
                  //     padding: EdgeInsets.symmetric(horizontal: 28.w),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.r),
                  //       gradient: LinearGradient(
                  //         colors: [
                  //           R.colors.primary,
                  //           R.colors.primary,
                  //         ],
                  //       ),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         SizedBox(
                  //           height: 64.r,
                  //           width: 64.r,
                  //           child: Assets.pngs.premiumBadge.image(),
                  //         ),
                  //         16.wb,
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             AppText(
                  //               text: weather?.description ?? '',
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //               color: R.colors.white,
                  //               letterSpacing: 0.08,
                  //             ),
                  //             AppText(
                  //               text: 'Remove Ads & Unlock All Feature',
                  //               color: R.colors.white,
                  //               fontWeight: FontWeight.w500,
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   );
                  // }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
