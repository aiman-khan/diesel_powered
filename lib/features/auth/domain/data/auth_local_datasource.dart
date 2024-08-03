////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import 'package:diesel_powered/features/auth/domain/usecases/delete_auth.dart';
import 'package:diesel_powered/features/auth/domain/usecases/get_auth.dart';
import 'package:diesel_powered/features/auth/domain/usecases/save_auth.dart';
import 'package:diesel_powered/infrastructure/datasource.dart';
////********** END IMPORTS **********////

abstract class AuthLocalDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [SaveAuthUsecaseInput] is received to [saveAuth] method as parameter
  /// [SaveAuthUsecaseOutput] is returned from [saveAuth] method
  Future<SaveAuthUsecaseOutput> saveAuth(SaveAuthUsecaseInput input);

  /// [GetAuthUsecaseInput] is received to [getAuth] method as parameter
  /// [GetAuthUsecaseOutput] is returned from [getAuth] method
  Future<GetAuthUsecaseOutput> getAuth(GetAuthUsecaseInput input);

  /// [DeleteAuthUsecaseInput] is received to [deleteAuth] method as parameter
  /// [DeleteAuthUsecaseOutput] is returned from [deleteAuth] method
  Future<DeleteAuthUsecaseOutput> deleteAuth(DeleteAuthUsecaseInput input);

////********** END METHODS **********////
}
