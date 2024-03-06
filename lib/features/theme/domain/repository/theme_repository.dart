import 'package:diesel_powered/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:diesel_powered/features/theme/domain/usecases/switch_theme_usecase.dart';

abstract class ThemeRepository {
  Future<SwitchThemeUsecaseOutput> switchTheme(SwitchThemeUsecaseInput input);

  Future<GetThemeUsecaseOutput> getTheme(GetThemeUsecaseInput input);
}
