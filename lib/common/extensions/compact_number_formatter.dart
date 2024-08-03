import 'package:intl/intl.dart';

extension CompactNumberFormat on num {
  String asKNotation() {
    final compact = NumberFormat.compact();
    return compact.format(this);
  }
}
