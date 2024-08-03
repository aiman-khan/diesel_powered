import 'package:diesel_powered/common/extensions/compact_number_formatter.dart';

class UnitConverter {
  static String poundsToKilograms(num pounds) {
    return (pounds * 0.45359237).asKNotation();
  }

  static String milesToKilometers(num miles) {
    return (miles * 1.609344).asKNotation();
  }
}

extension UnitConversionExtension on num {
  String get toKilograms => UnitConverter.poundsToKilograms(this);
  String get toKilometers => UnitConverter.milesToKilometers(this);
  String get toLbs => asKNotation();
  String get toMi => asKNotation();
}
