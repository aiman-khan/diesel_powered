import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_error_message_provider.g.dart';

@riverpod
class ShowErrorMessage extends _$ShowErrorMessage {
  @override
  bool build() => false;

  @override
  set state(bool newState) => super.state = newState;
}
