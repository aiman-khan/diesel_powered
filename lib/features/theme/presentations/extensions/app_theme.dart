import 'package:calculator_flutter_app/features/theme/presentations/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_flutter_app/features/theme/domain/models/theme/theme.dart';

extension ThemeContext on BuildContext {
  AppTheme get appTheme {
    final container = ProviderScope.containerOf(this);
    return container.read(appThemeProvider);
  }
}
