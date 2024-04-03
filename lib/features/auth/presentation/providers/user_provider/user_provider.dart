import 'package:calculator_flutter_app/features/auth/domain/models/user/user_model.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/current_user.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<UserModel?> user(UserRef ref) async {
  final getUser = sl<CurrentUserUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = CurrentUserUsecaseInput(bearer: bearer!);
  final output = await getUser(input);
  return output.user;
}
