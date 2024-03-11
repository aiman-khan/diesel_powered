import 'package:calculator_flutter_app/features/google_maps/domain/models/location/location_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCurrentLocationProvider =
    StateProvider.autoDispose<LocationModel?>((ref) {
  return null;
});
