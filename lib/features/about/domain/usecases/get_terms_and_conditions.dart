import 'package:calculator_flutter_app/features/about/domain/models/about/content_entity.dart';
import 'package:calculator_flutter_app/features/about/domain/models/about/content_model.dart';
import 'package:calculator_flutter_app/features/about/domain/repository/about_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetTermsAndConditionsUsecaseInput extends Input {
  GetTermsAndConditionsUsecaseInput({required this.bearer});

  final String bearer;
}

class GetTermsAndConditionsUsecaseOutput extends Output {
  GetTermsAndConditionsUsecaseOutput({required ContentEntity content})
      : _content = content;

  final ContentEntity _content;

  ContentModel get content => ContentModel.fromEntity(_content);
}

@lazySingleton
class GetTermsAndConditionsUsecase extends Usecase<
    GetTermsAndConditionsUsecaseInput, GetTermsAndConditionsUsecaseOutput> {
  final AboutRepository _aboutRepository;

  GetTermsAndConditionsUsecase({required AboutRepository aboutRepository})
      : _aboutRepository = aboutRepository;

  @override
  Future<GetTermsAndConditionsUsecaseOutput> call(
      GetTermsAndConditionsUsecaseInput input) async {
    return await _aboutRepository.getTermsAndConditions(input);
  }
}
