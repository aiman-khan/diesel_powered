import 'package:diesel_powered/features/about/domain/models/about/content_model.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:diesel_powered/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'privacy_policy_provider.g.dart';

@riverpod
Future<ContentModel> getPrivacyPolicy(GetPrivacyPolicyRef ref) async {
  final getPrivacyPolicy = sl<GetPrivacyPolicyUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetPrivacyPolicyUsecaseInput(bearer: bearer!);
  final output = await getPrivacyPolicy(input);
  return output.content;
}
