import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_exit_dialog.dart';
import 'package:calculator_flutter_app/features/auth/presentation/views/profile/profile_view.dart';
import 'package:calculator_flutter_app/features/calculator/presentation/views/calculator/calculator_view.dart';
import 'package:calculator_flutter_app/features/google_maps/domain/models/location/location_model.dart';
import 'package:calculator_flutter_app/features/google_maps/presentation/providers/request_location_permission_provider.dart';
import 'package:calculator_flutter_app/features/home/domain/enums/bottom_nav_item.dart';
import 'package:calculator_flutter_app/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:calculator_flutter_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:calculator_flutter_app/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
import 'package:calculator_flutter_app/features/location_tracker/presentation/views/location_tracker/location_tracker_view.dart';
import 'package:calculator_flutter_app/features/schedule_planner/presentation/views/schedule_planner/schedule_planner_view.dart';
import 'package:calculator_flutter_app/features/weather/presentation/providers/user_current_location_provider.dart';
import 'package:calculator_flutter_app/features/weather/presentation/views/weather/weather_view.dart';
import 'package:calculator_flutter_app/util/exceptions/message_exception.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  Widget view(BottomNavItem currentView) {
    if (currentView.isLocation) return const LocationTrackerView();
    if (currentView.isCalendar) return const SchedulePlanner();
    if (currentView.isCalculator) return const CalculatorView();
    if (currentView.isWeather) return const WeatherView();
    if (currentView.isProfile) return const ProfileView();

    return const SizedBox();
  }

  Future<bool> onWillPop(BuildContext context) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AppExitDialog(
          color: R.colors.primary,
        );
      },
    );

    return Future.value(false);
  }

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

  @override
  Widget build(BuildContext context) {
    final currentView = ref.watch(selectedNavItemProvider);
    final mediaQueryPadding = MediaQuery.of(context).padding;
    ref.watch(userCurrentLocationProvider);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: PopScope(
        onPopInvoked: (v) {
          if (currentView != BottomNavItem.calculator) {
            ref
                .read(selectedNavItemProvider.notifier)
                .update((state) => BottomNavItem.calculator);
          } else {
            onWillPop(context);
          }
        },
        canPop: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: R.colors.white,
          bottomNavigationBar: const AppBottomNavBar(),
          body: Padding(
            padding: EdgeInsets.only(
              top: mediaQueryPadding.top,
            ),
            child: Column(
              children: [
                8.hb,

                /// [View]
                Expanded(
                  child: view(currentView),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
