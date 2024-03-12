import 'package:calculator_flutter_app/features/theme/domain/repository/theme_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class SwitchThemeUsecaseInput extends Input {
  SwitchThemeUsecaseInput();
}

class SwitchThemeUsecaseOutput extends Output {
  SwitchThemeUsecaseOutput();
}

@lazySingleton
class SwitchThemeUsecase
    extends Usecase<SwitchThemeUsecaseInput, SwitchThemeUsecaseOutput> {
  final ThemeRepository _themeRepository;

  SwitchThemeUsecase({required ThemeRepository themeRepository})
      : _themeRepository = themeRepository;

  @override
  Future<SwitchThemeUsecaseOutput> call(SwitchThemeUsecaseInput input) async {
    return await _themeRepository.switchTheme(input);
  }
}
