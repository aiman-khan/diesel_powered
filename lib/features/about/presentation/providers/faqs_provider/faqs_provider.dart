import 'package:diesel_powered/features/about/domain/models/faq/faq_model.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_faqs.dart';
import 'package:diesel_powered/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faqs_provider.g.dart';

@riverpod
Future<List<FaqModel>> faqs(FaqsRef ref) async {
  final getFaqs = sl<GetFaqsUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetFaqsUsecaseInput(bearer: bearer!);
  final output = await getFaqs(input);

  return output.faqs;
}
