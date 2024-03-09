import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestLocationPermissionUsecaseInput extends Input {
  RequestLocationPermissionUsecaseInput();
}

class RequestLocationPermissionUsecaseOutput extends Output {
  RequestLocationPermissionUsecaseOutput();
}

@lazySingleton
class RequestLocationPermissionUsecase extends Usecase<
    RequestLocationPermissionUsecaseInput,
    RequestLocationPermissionUsecaseOutput> {
  bool _permissionEnabled = false;

  @override
  Future<RequestLocationPermissionUsecaseOutput> call(Input input) async {
    _permissionEnabled = await Permission.location.isGranted;

    if (!_permissionEnabled) {
      final permissionStatus = await Permission.location.request();

      if (permissionStatus.isPermanentlyDenied) {
        throw LocationPermissionDeniedPermanently(
          message: 'Location permission is permanently denied',
        );
      } else if (permissionStatus.isDenied) {
        throw MessageException(
          message: 'Location permission is denied',
        );
      }
    }

    return RequestLocationPermissionUsecaseOutput();
  }
}
