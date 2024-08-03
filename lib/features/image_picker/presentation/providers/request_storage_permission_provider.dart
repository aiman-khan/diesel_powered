import 'package:diesel_powered/features/image_picker/domain/usecases/request_storage_permission.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'request_storage_permission_provider.g.dart';

@riverpod
Future<void> requestStoragePermission(Ref ref) async {
  final requestStoragePermissionUsecase = sl<RequestStoragePermissionUsecase>();
  await requestStoragePermissionUsecase(NoInput());
}
