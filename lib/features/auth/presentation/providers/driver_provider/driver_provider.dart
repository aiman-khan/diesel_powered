import 'package:diesel_powered/features/auth/domain/models/user/user_model.dart';
import 'package:diesel_powered/features/auth/domain/usecases/current_user.dart';
import 'package:diesel_powered/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'driver_provider.g.dart';

@riverpod
Future<UserModel?> driver(DriverRef ref) async {
  final getUser = sl<CurrentUserUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = CurrentUserUsecaseInput(bearer: bearer!);
  final output = await getUser(input);
  return output.driver;
}
