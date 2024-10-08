import 'package:calculator_flutter_app/features/about/domain/models/about/content_model.dart';
import 'package:calculator_flutter_app/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:calculator_flutter_app/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'terms_and_conditions_provider.g.dart';

@riverpod
Future<ContentModel> getTermsAndConditions(GetTermsAndConditionsRef ref) async {
  final getTermsAndConditions = sl<GetTermsAndConditionsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetTermsAndConditionsUsecaseInput(bearer: bearer!);
  final output = await getTermsAndConditions(input);
  return output.content;
}
