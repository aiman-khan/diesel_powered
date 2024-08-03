import 'package:diesel_powered/features/about/domain/models/faq/faq_entity.dart';
import 'package:diesel_powered/features/about/domain/models/faq/faq_model.dart';
import 'package:diesel_powered/features/about/domain/repository/about_repository.dart';
import 'package:diesel_powered/infrastructure/usecase.dart';
import 'package:diesel_powered/infrastructure/usecase_input.dart';
import 'package:diesel_powered/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class GetFaqsUsecaseInput extends Input {
  GetFaqsUsecaseInput({required this.bearer});

  final String bearer;
}

class GetFaqsUsecaseOutput extends Output {
  GetFaqsUsecaseOutput({required List<FaqEntity> faqs}) : _faqs = faqs;

  final List<FaqEntity> _faqs;

  List<FaqModel> get faqs => _faqs.map(FaqModel.fromEntity).toList();
}

@lazySingleton
class GetFaqsUsecase
    extends Usecase<GetFaqsUsecaseInput, GetFaqsUsecaseOutput> {
  final AboutRepository _aboutRepository;

  GetFaqsUsecase({required AboutRepository aboutRepository})
      : _aboutRepository = aboutRepository;

  @override
  Future<GetFaqsUsecaseOutput> call(GetFaqsUsecaseInput input) async {
    return await _aboutRepository.getFaqs(input);
  }
}
