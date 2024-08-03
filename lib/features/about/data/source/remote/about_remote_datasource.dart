////********** START IMPORTS **********////
import 'package:diesel_powered/features/about/domain/usecases/get_about.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_faqs.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:diesel_powered/infrastructure/datasource.dart';
////********** END IMPORTS **********////

abstract class AboutRemoteDataSource extends DataSource {
  ////********** START METHODS **********////
  /// [GetTermsAndConditionsUsecaseInput] is received to [getTermsAndConditions] method as parameter
  /// [GetTermsAndConditionsUsecaseOutput] is returned from [getTermsAndConditions] method
  Future<GetTermsAndConditionsUsecaseOutput> getTermsAndConditions(
      GetTermsAndConditionsUsecaseInput input);

  /// [GetPrivacyPolicyUsecaseInput] is received to [getPrivacyPolicy] method as parameter
  /// [GetPrivacyPolicyUsecaseOutput] is returned from [getPrivacyPolicy] method
  Future<GetPrivacyPolicyUsecaseOutput> getPrivacyPolicy(
      GetPrivacyPolicyUsecaseInput input);

  /// [GetAboutUsecaseInput] is received to [getAbout] method as parameter
  /// [GetAboutUsecaseOutput] is returned from [getAbout] method
  Future<GetAboutUsecaseOutput> getAbout(GetAboutUsecaseInput input);

  /// [GetFaqsUsecaseInput] is received to [getFaqs] method as parameter
  /// [GetFaqsUsecaseOutput] is returned from [getFaqs] method
  Future<GetFaqsUsecaseOutput> getFaqs(GetFaqsUsecaseInput input);

////********** END METHODS **********////
}
