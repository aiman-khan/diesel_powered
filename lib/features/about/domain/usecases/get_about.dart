import 'package:calculator_flutter_app/features/about/domain/models/about/content_entity.dart';
import 'package:calculator_flutter_app/features/about/domain/models/about/content_model.dart';
import 'package:calculator_flutter_app/features/about/domain/repository/about_repository.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetAboutUsecaseInput extends Input {
  GetAboutUsecaseInput({required this.bearer});

  final String bearer;
}

class GetAboutUsecaseOutput extends Output {
  GetAboutUsecaseOutput({required ContentEntity content}) : _content = content;

  final ContentEntity _content;

  ContentModel get content => ContentModel.fromEntity(_content);
}

@lazySingleton
class GetAboutUsecase
    extends Usecase<GetAboutUsecaseInput, GetAboutUsecaseOutput> {
  final AboutRepository _aboutRepository;

  GetAboutUsecase({required AboutRepository aboutRepository})
      : _aboutRepository = aboutRepository;

  @override
  Future<GetAboutUsecaseOutput> call(GetAboutUsecaseInput input) async {
    return await _aboutRepository.getAbout(input);
  }
}
