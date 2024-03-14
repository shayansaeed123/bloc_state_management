import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {

  final _imagePicker = ImagePicker();

  Future<XFile?>  pickImageCamera() async {
    XFile? pickedFile;
    pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    return pickedFile;
  }

  Future<XFile?>  pickImageGallery() async {
    XFile? pickedFile;
    pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }
}