import 'package:diesel_powered/features/google_maps/domain/usecases/request_location_permission.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'request_location_permission_provider.g.dart';

@riverpod
Future<void> requestLocationPermission(Ref ref) async {
  final requestLocationPermissionUsecase =
      sl<RequestLocationPermissionUsecase>();
  await requestLocationPermissionUsecase(NoInput());
}
