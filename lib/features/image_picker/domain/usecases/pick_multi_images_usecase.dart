import 'package:calculator_flutter_app/features/image_picker/domain/data/image_picker_data_source.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickMultiGalleryImagesUsecase implements Usecase<NoInput, List<String>> {
  PickMultiGalleryImagesUsecase({required ImagePickerHelper image})
      : _image = image;
  final ImagePickerHelper _image;

  @override
  Future<List<String>> call(NoInput input) async {
    return _image.multiGalleryImages();
  }
}
