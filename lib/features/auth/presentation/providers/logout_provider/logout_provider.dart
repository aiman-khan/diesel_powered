import 'package:diesel_powered/features/auth/domain/usecases/delete_auth.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Future<void> logout(LogoutRef ref) async {
  final logout = sl<DeleteAuthUsecase>();
  await logout(DeleteAuthUsecaseInput());
}
