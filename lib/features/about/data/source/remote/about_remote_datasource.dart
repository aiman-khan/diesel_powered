import 'package:calculator_flutter_app/features/about/domain/usecases/get_about.dart';
import 'package:calculator_flutter_app/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:calculator_flutter_app/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:calculator_flutter_app/infrastructure/datasource.dart';

abstract class AboutRemoteDataSource extends DataSource {
  Future<GetTermsAndConditionsUsecaseOutput> getTermsAndConditions(
      GetTermsAndConditionsUsecaseInput input);

  Future<GetPrivacyPolicyUsecaseOutput> getPrivacyPolicy(
      GetPrivacyPolicyUsecaseInput input);

  Future<GetAboutUsecaseOutput> getAbout(GetAboutUsecaseInput input);
}
