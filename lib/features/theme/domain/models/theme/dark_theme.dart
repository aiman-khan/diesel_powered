import 'dart:ui';

import 'package:calculator_flutter_app/features/theme/domain/models/theme/theme.dart';

class AppDarkTheme implements AppTheme {
  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get blue => const Color(0xFF208AEB);

  @override
  Color get orange => const Color(0xFFF15735);

  @override
  Color get primaryDark => const Color(0xFF063E1E);

  @override
  Color get primaryLight => const Color(0xFF19B86C);

  @override
  Color get secondary => const Color(0xFF1D1D1D);

  @override
  Color get textFieldGrey => const Color(0xFFF9FAF9);

  @override
  Color get warningRed => const Color(0xFFFF1616);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get bgColor => const Color(0xFF000000);
}
