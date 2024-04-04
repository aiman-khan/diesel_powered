import 'package:calculator_flutter_app/features/auth/domain/usecases/get_auth.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bearer_provider.g.dart';

@riverpod
Future<String?> bearerToken(BearerTokenRef ref) async {
  final getAuth = sl<GetAuthUsecase>();
  final output = await getAuth(GetAuthUsecaseInput());
  return output.bearerToken;
}
