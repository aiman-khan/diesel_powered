import 'package:calculator_flutter_app/features/theme/domain/data/theme_local_data_source.dart';
import 'package:calculator_flutter_app/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:calculator_flutter_app/features/theme/domain/usecases/switch_theme_usecase.dart';
import 'package:calculator_flutter_app/helpers/persistence/persistence_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

const _themeKey = 'theme';

@LazySingleton(as: ThemeLocalDataSource)
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final Logger _logger;
  final PersistenceHelper _persistenceHelper;

  ThemeLocalDataSourceImpl({
    required Logger logger,
    required PersistenceHelper persistenceHelper,
  })  : _logger = logger,
        _persistenceHelper = persistenceHelper;

  @override
  Future<SwitchThemeUsecaseOutput> switchTheme(
      SwitchThemeUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final output = await getTheme(GetThemeUsecaseInput());
      final theme = output.theme;
      await _persistenceHelper.saveString(
        _themeKey,
        theme == 'dark' ? 'light' : 'dark',
      );
      return SwitchThemeUsecaseOutput();
    } catch (e) {
      _logger.i("$e");
      rethrow;
    }
  }

  @override
  Future<GetThemeUsecaseOutput> getTheme(GetThemeUsecaseInput input) async {
    try {
      final theme = await _persistenceHelper.getString(_themeKey);
      _logger.i("Theme: $theme");
      return GetThemeUsecaseOutput(theme: theme ?? 'light');
    } catch (e) {
      _logger.i("$e");
      return GetThemeUsecaseOutput(theme: 'light');
    }
  }
}
