import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_exit_dialog.dart';
import 'package:diesel_powered/features/auth/presentation/views/profile/profile_view.dart';
import 'package:diesel_powered/features/home/domain/enums/bottom_nav_item.dart';
import 'package:diesel_powered/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:diesel_powered/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:diesel_powered/features/weather/presentation/views/weather/weather_view.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  Widget view(BottomNavItem currentView) {
    if (currentView.isLocation) return const SizedBox();
    if (currentView.isCalendar) return const SizedBox();
    if (currentView.isCalculator) return const SizedBox();
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
  Widget build(BuildContext context) {
    final currentView = ref.watch(selectedNavItemProvider);
    final mediaQueryPadding = MediaQuery.of(context).padding;

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
