import 'package:diesel_powered/features/auth/domain/usecases/delete_auth.dart';
import 'package:diesel_powered/features/auth/domain/usecases/get_auth.dart';
import 'package:diesel_powered/features/auth/domain/usecases/save_auth.dart';
import 'package:diesel_powered/infrastructure/datasource.dart';

abstract class AuthLocalDataSource extends DataSource {
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input);

  Future<GetAuthUsecaseOutput> getAuth(GetAuthUsecaseInput input);

  Future<DeleteAuthUsecaseOutput> deleteAuth(DeleteAuthUsecaseInput input);
}
