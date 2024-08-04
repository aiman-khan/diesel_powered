import 'package:diesel_powered/features/about/data/source/remote/about_remote_datasource.dart';
import 'package:diesel_powered/features/about/domain/repository/about_repository.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_about.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AboutRepository)
class AboutRepositoryImp implements AboutRepository {
  final AboutRemoteDataSource _aboutRemoteDataSource;

  AboutRepositoryImp({
    required AboutRemoteDataSource aboutRemoteDataSource,
  }) : _aboutRemoteDataSource = aboutRemoteDataSource;

  @override
  Future<GetTermsAndConditionsUsecaseOutput> getTermsAndConditions(
      GetTermsAndConditionsUsecaseInput input) async {
    return _aboutRemoteDataSource.getTermsAndConditions(input);
  }

  @override
  Future<GetPrivacyPolicyUsecaseOutput> getPrivacyPolicy(
      GetPrivacyPolicyUsecaseInput input) async {
    return _aboutRemoteDataSource.getPrivacyPolicy(input);
  }

  @override
  Future<GetAboutUsecaseOutput> getAbout(GetAboutUsecaseInput input) async {
    return _aboutRemoteDataSource.getAbout(input);
  }
}
