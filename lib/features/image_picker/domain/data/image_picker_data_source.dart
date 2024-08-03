abstract class ImagePickerHelper {
  Future<String> cameraImage();
  Future<String> galleryImage();
  Future<List<String>> multiGalleryImages();
}
