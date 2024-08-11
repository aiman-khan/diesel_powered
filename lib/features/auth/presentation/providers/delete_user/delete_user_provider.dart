import 'package:diesel_powered/features/auth/domain/usecases/delete_user.dart';
import 'package:diesel_powered/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_user_provider.g.dart';

@riverpod
Future<DeleteUserUsecaseOutput> deleteUser(DeleteUserRef ref) async {
  final deleteUser = sl<DeleteUserUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = DeleteUserUsecaseInput(bearer: bearer!);
  return deleteUser(input);
}
