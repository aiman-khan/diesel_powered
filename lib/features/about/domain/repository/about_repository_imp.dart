////********** START IMPORTS **********////
import 'package:diesel_powered/features/about/data/source/remote/about_remote_datasource.dart';
import 'package:diesel_powered/features/about/domain/repository/about_repository.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_about.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_faqs.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:injectable/injectable.dart';
////********** END IMPORTS **********////

@LazySingleton(as: AboutRepository)
class AboutRepositoryImp implements AboutRepository {
////********** START VARIABLES **********////
  final AboutRemoteDataSource _aboutRemoteDataSource;
////********** END VARIABLES **********////

  AboutRepositoryImp({
////********** START RECEIVE VALUES **********////
    required AboutRemoteDataSource aboutRemoteDataSource,
////********** END RECEIVE VALUES **********////
  }) :
////********** START SET VALUES **********////
        _aboutRemoteDataSource = aboutRemoteDataSource
////********** END SET VALUES **********////
  ;

////********** START METHODS **********////
  /// [GetTermsAndConditionsUsecaseInput] is received to [getTermsAndConditions] method as parameter
  /// [GetTermsAndConditionsUsecaseOutput] is returned from [getTermsAndConditions] method
  @override
  Future<GetTermsAndConditionsUsecaseOutput> getTermsAndConditions(
      GetTermsAndConditionsUsecaseInput input) async {
    return _aboutRemoteDataSource.getTermsAndConditions(input);
  }

  /// [GetPrivacyPolicyUsecaseInput] is received to [getPrivacyPolicy] method as parameter
  /// [GetPrivacyPolicyUsecaseOutput] is returned from [getPrivacyPolicy] method
  @override
  Future<GetPrivacyPolicyUsecaseOutput> getPrivacyPolicy(
      GetPrivacyPolicyUsecaseInput input) async {
    return _aboutRemoteDataSource.getPrivacyPolicy(input);
  }

  /// [GetAboutUsecaseInput] is received to [getAbout] method as parameter
  /// [GetAboutUsecaseOutput] is returned from [getAbout] method
  @override
  Future<GetAboutUsecaseOutput> getAbout(GetAboutUsecaseInput input) async {
    return _aboutRemoteDataSource.getAbout(input);
  }

  /// [GetFaqsUsecaseInput] is received to [getFaqs] method as parameter
  /// [GetFaqsUsecaseOutput] is returned from [getFaqs] method
  @override
  Future<GetFaqsUsecaseOutput> getFaqs(GetFaqsUsecaseInput input) async {
    return _aboutRemoteDataSource.getFaqs(input);
  }

////********** END METHODS **********////
}
