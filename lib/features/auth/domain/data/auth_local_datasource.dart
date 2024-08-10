import 'package:calculator_flutter_app/features/auth/domain/usecases/delete_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/get_auth.dart';
import 'package:calculator_flutter_app/features/auth/domain/usecases/save_auth.dart';
import 'package:calculator_flutter_app/infrastructure/datasource.dart';

abstract class AuthLocalDataSource extends DataSource {
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input);

  Future<GetAuthUsecaseOutput> getAuth(GetAuthUsecaseInput input);

  Future<DeleteAuthUsecaseOutput> deleteAuth(DeleteAuthUsecaseInput input);
}
