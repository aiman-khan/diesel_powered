import 'package:calculator_flutter_app/features/auth/domain/models/auth_step/auth_step_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_step_provider.g.dart';

@riverpod
class AuthStepNotifier extends _$AuthStepNotifier {
  @override
  AuthStepModel build() => AuthStepModel.register;

  @override
  set state(AuthStepModel newState) => super.state = newState;

  AuthStepModel update(AuthStepModel Function(AuthStepModel state) cb) =>
      state = cb(state);
}
