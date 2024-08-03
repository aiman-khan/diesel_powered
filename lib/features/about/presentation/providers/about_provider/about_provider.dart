import 'package:diesel_powered/features/about/domain/models/about/content_model.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_about.dart';
import 'package:diesel_powered/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:diesel_powered/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_provider.g.dart';

@riverpod
Future<ContentModel> getAbout(GetAboutRef ref) async {
  final getAbout = sl<GetAboutUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);

  final input = GetAboutUsecaseInput(bearer: bearer!);
  final output = await getAbout(input);
  return output.content;
}
