import 'package:calculator_flutter_app/features/about/domain/models/about/content_entity.dart';
import 'package:calculator_flutter_app/features/about/domain/models/about/content_model.dart';
import 'package:calculator_flutter_app/features/about/domain/repository/about_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetPrivacyPolicyUsecaseInput extends Input {
  GetPrivacyPolicyUsecaseInput({required this.bearer});

  final String bearer;
}

class GetPrivacyPolicyUsecaseOutput extends Output {
  GetPrivacyPolicyUsecaseOutput({required ContentEntity content})
      : _content = content;

  final ContentEntity _content;

  ContentModel get content => ContentModel.fromEntity(_content);
}

@lazySingleton
class GetPrivacyPolicyUsecase extends Usecase<GetPrivacyPolicyUsecaseInput,
    GetPrivacyPolicyUsecaseOutput> {
  final AboutRepository _aboutRepository;

  GetPrivacyPolicyUsecase({required AboutRepository aboutRepository})
      : _aboutRepository = aboutRepository;

  @override
  Future<GetPrivacyPolicyUsecaseOutput> call(
      GetPrivacyPolicyUsecaseInput input) async {
    return await _aboutRepository.getPrivacyPolicy(input);
  }
}
