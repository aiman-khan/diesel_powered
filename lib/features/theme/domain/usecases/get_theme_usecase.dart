import 'package:calculator_flutter_app/features/theme/domain/repository/theme_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetThemeUsecaseInput extends Input {
  GetThemeUsecaseInput();
}

class GetThemeUsecaseOutput extends Output {
  GetThemeUsecaseOutput({required this.theme});

  final String theme;
}

@lazySingleton
class GetThemeUsecase
    extends Usecase<GetThemeUsecaseInput, GetThemeUsecaseOutput> {
  final ThemeRepository _themeRepository;

  GetThemeUsecase({required ThemeRepository themeRepository})
      : _themeRepository = themeRepository;

  @override
  Future<GetThemeUsecaseOutput> call(GetThemeUsecaseInput input) async {
    return await _themeRepository.getTheme(input);
  }
}
