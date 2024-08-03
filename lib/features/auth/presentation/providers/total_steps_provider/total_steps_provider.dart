import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'total_steps_provider.g.dart';

@riverpod
class TotalStepsNotifier extends _$TotalStepsNotifier {
  @override
  int build() => 6;

  @override
  set state(int newState) => super.state = newState;

  int update(int Function(int state) cb) => state = cb(state);
}
