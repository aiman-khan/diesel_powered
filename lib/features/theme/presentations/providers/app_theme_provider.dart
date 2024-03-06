import 'package:diesel_powered/features/theme/domain/models/theme/dark_theme.dart';
import 'package:diesel_powered/features/theme/domain/models/theme/light_theme.dart';
import 'package:diesel_powered/features/theme/domain/models/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeNotifier extends StateNotifier<AppTheme> {
  AppThemeNotifier() : super(AppLightTheme());

  void switchTheme() {
    if (state is AppLightTheme) {
      state = AppDarkTheme();
    } else {
      state = AppLightTheme();
    }
  }
}

final appThemeProvider =
    StateNotifierProvider<AppThemeNotifier, AppTheme>((ref) {
  return AppThemeNotifier();
});
