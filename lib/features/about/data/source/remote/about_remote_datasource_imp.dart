////********** START IMPORTS **********////
import 'package:diesel_powered/features/about/data/entities/content/rest_content_entity.dart';
import 'package:diesel_powered/features/about/data/entities/faq/rest_faq_entity.dart';
import 'package:diesel_powered/features/about/data/source/remote/about_remote_datasource.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_about.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_faqs.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_privacy_policy.dart';
import 'package:diesel_powered/features/about/domain/usecases/get_terms_and_conditions.dart';
import 'package:diesel_powered/helpers/network_call_helper/network_call_helper.dart';
import 'package:diesel_powered/util/consts/api.dart';
import 'package:diesel_powered/util/exceptions/message_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
////********** END IMPORTS **********////

@LazySingleton(as: AboutRemoteDataSource)
class AboutRemoteDataSourceImp implements AboutRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  AboutRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

////********** START METHODS **********////
  @override
  Future<GetTermsAndConditionsUsecaseOutput> getTermsAndConditions(
      GetTermsAndConditionsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.termsConditions,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data = response['data'] as Map<String, dynamic>;

      final content = RestContentEntity.fromJson(data);

      return GetTermsAndConditionsUsecaseOutput(content: content);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getTermsAndConditions: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetPrivacyPolicyUsecaseInput] is received to [getPrivacyPolicy] method as parameter
  /// [GetPrivacyPolicyUsecaseOutput] is returned from [getPrivacyPolicy] method
  @override
  Future<GetPrivacyPolicyUsecaseOutput> getPrivacyPolicy(
      GetPrivacyPolicyUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.privacyPolicy,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data = response['data'] as Map<String, dynamic>;

      final content = RestContentEntity.fromJson(data);

      return GetPrivacyPolicyUsecaseOutput(content: content);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getPrivacyPolicy: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetAboutUsecaseInput] is received to [getAbout] method as parameter
  /// [GetAboutUsecaseOutput] is returned from [getAbout] method
  @override
  Future<GetAboutUsecaseOutput> getAbout(GetAboutUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.aboutUs,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data = response['data'] as Map<String, dynamic>;

      final content = RestContentEntity.fromJson(data);

      return GetAboutUsecaseOutput(content: content);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getAbout: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetFaqsUsecaseInput] is received to [getFaqs] method as parameter
  /// [GetFaqsUsecaseOutput] is returned from [getFaqs] method
  @override
  Future<GetFaqsUsecaseOutput> getFaqs(GetFaqsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.faqs,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data =
          List<Map<String, dynamic>>.from(response['data'] as List<dynamic>);

      final faqs = data.map(RestFaqEntity.fromJson).toList();

      return GetFaqsUsecaseOutput(faqs: faqs);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getFaqs: $e");
      throw SomethingWentWrongException();
    }
  }

////********** END METHODS **********////
}
