import 'package:diesel_powered/features/about/data/source/remote/about_remote_datasource.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_about.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:diesel_powered/helpers/network_call_helper/network_call_helper.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AboutRemoteDataSource)
class AboutRemoteDataSourceImp implements AboutRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  AboutRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

  @override
  Future<GetTermsAndConditionsUsecaseOutput> getTermsAndConditions(
      GetTermsAndConditionsUsecaseInput input) async {
    throw UnimplementedError();
  }

  @override
  Future<GetPrivacyPolicyUsecaseOutput> getPrivacyPolicy(
      GetPrivacyPolicyUsecaseInput input) async {
    throw UnimplementedError();
  }

  @override
  Future<GetAboutUsecaseOutput> getAbout(GetAboutUsecaseInput input) async {
    throw UnimplementedError();
  }
}
