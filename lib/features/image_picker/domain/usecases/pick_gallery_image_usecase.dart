import 'package:calculator_flutter_app/features/image_picker/domain/data/image_picker_data_source.dart';
import 'package:calculator_flutter_app/infrastructure/usecase.dart';
import 'package:calculator_flutter_app/infrastructure/usecase_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickGalleryImageUsecase implements Usecase<NoInput, String> {
  PickGalleryImageUsecase({required ImagePickerHelper image}) : _image = image;
  final ImagePickerHelper _image;

  @override
  Future<String> call(NoInput imagePath) async {
    return _image.galleryImage();
  }
}
