import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_step_provider.g.dart';

@riverpod
class RegisterStep extends _$RegisterStep {
  void next(int steps) {
    if (state < steps) {
      state = state + 1;
    }
  }

  void prev() {
    if (state > 1) {
      state = state - 1;
    }
  }

  @override
  set state(int newState) => super.state = newState;

  @override
  int build() {
    return 1;
  }
}
