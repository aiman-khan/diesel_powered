import 'package:calculator_flutter_app/features/auth/domain/data/auth_local_datasource.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/delete_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/get_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/save_auth.dart';
import 'package:calculator_flutter_app/helpers/persistence/persistence_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

const _authKey = 'auth';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final Logger _logger;
  final PersistenceHelper _persistenceHelper;

  AuthLocalDataSourceImp({
    required Logger logger,
    required PersistenceHelper persistenceHelper,
  })  : _logger = logger,
        _persistenceHelper = persistenceHelper;

  @override
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      await _persistenceHelper.saveString(_authKey, input.bearerToken!);
      _logger.i('Saved bearer.. ${input.bearerToken}');
      return SaveAuthUsecaseOutput();
    } catch (e) {
      _logger.i("$e");
      rethrow;
    }
  }

  @override
  Future<GetAuthUsecaseOutput> getAuth(GetAuthUsecaseInput input) async {
    try {
      final bearer = await _persistenceHelper.getString(_authKey);
      _logger.i("Auth: $bearer");
      return GetAuthUsecaseOutput(bearerToken: bearer);
    } catch (e) {
      _logger.i("$e");
      return GetAuthUsecaseOutput();
    }
  }

  @override
  Future<DeleteAuthUsecaseOutput> deleteAuth(
      DeleteAuthUsecaseInput input) async {
    try {
      await _persistenceHelper.delete(_authKey);
      return DeleteAuthUsecaseOutput();
    } catch (e) {
      _logger.i("$e");
      return DeleteAuthUsecaseOutput();
    }
  }
}
