import 'package:diesel_powered/features/theme/domain/data/theme_local_data_source.dart';
import 'package:diesel_powered/features/theme/domain/repository/theme_repository.dart';
import 'package:diesel_powered/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:diesel_powered/features/theme/domain/usecases/switch_theme_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _themeLocalDataSource;

  ThemeRepositoryImpl({
    required ThemeLocalDataSource authLocalDataSource,
  }) : _themeLocalDataSource = authLocalDataSource;

  @override
  Future<SwitchThemeUsecaseOutput> switchTheme(SwitchThemeUsecaseInput input) {
    return _themeLocalDataSource.switchTheme(input);
  }

  @override
  Future<GetThemeUsecaseOutput> getTheme(GetThemeUsecaseInput input) {
    return _themeLocalDataSource.getTheme(input);
  }
}
