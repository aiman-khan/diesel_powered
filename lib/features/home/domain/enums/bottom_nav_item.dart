import 'package:diesel_powered/gen/assets.gen.dart';

enum BottomNavItem {
  calculator,
  calendar,
  location,
  weather,
  profile;

  String get iconPath {
    return switch (this) {
      calculator => Assets.svgs.calculatorIcon.path,
      calendar => Assets.svgs.calendarIcon.path,
      location => Assets.svgs.locationIcon.path,
      weather => Assets.svgs.humidityIcon.path,
      profile => Assets.svgs.profileIcon.path,
    };
  }

  bool get isCalculator => this == BottomNavItem.calculator;
  bool get isCalendar => this == BottomNavItem.calendar;
  bool get isLocation => this == BottomNavItem.location;
  bool get isWeather => this == BottomNavItem.weather;
  bool get isProfile => this == BottomNavItem.profile;
}
