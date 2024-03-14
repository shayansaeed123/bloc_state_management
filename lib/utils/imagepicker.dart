import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
    await postImageToApi(File(pickedFile!.path));
    return pickedFile;
  }

  Future<void> postImageToApi(File imageFile) async {
  // Replace 'https://example.com/upload' with your API endpoint
  var request = http.MultipartRequest('POST', Uri.parse('https://freeimage.host/api/1/upload/?key=6d207e02198a847aa98d0a2a901485a5'));
  request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Image uploaded successfully');
  } else {
    print('Failed to upload image: ${response.statusCode}');
  }
}
}