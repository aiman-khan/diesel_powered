import 'dart:io';

import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestStoragePermissionUsecaseInput extends Input {
  RequestStoragePermissionUsecaseInput();
}

class RequestStoragePermissionUsecaseOutput extends Output {
  RequestStoragePermissionUsecaseOutput();
}

@lazySingleton
class RequestStoragePermissionUsecase extends Usecase<
    RequestStoragePermissionUsecaseInput,
    RequestStoragePermissionUsecaseOutput> {
  bool _permissionEnabled = false;

  @override
  Future<RequestStoragePermissionUsecaseOutput> call(Input input) async {
    _permissionEnabled = await (Platform.isAndroid
        ? Permission.storage.isGranted
        : Permission.photos.isGranted);

    if (!_permissionEnabled) {
      final permissionStatus = await Permission.photos.request();

      if (permissionStatus.isPermanentlyDenied) {
        throw StoragePermissionDeniedPermanently(
          message: 'Storage permission is permanently denied',
        );
      } else if (permissionStatus.isDenied) {
        throw MessageException(
          message: 'Storage permission is denied',
        );
      }
    }
    return RequestStoragePermissionUsecaseOutput();
  }
}
