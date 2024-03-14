import 'package:bloc/bloc.dart';
import 'package:blocs/bloc/imagePicker/image_picker_event.dart';
import 'package:blocs/bloc/imagePicker/image_picker_state.dart';
import 'package:blocs/utils/imagepicker.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState>{
  
  final ImagePickerUtils imagePicker ;
  ImagePickerBloc(this.imagePicker) : super(ImagePickerState()){
    on<GetImageFromGallery>(_getImageGallery);
    on<GetImageFromCamera>(_getImageCamera);
  }

  void  _getImageGallery(GetImageFromGallery event, Emitter<ImagePickerState> emit)async{

    XFile? file = await imagePicker.pickImageGallery();
    emit(state.copyWith(file: file));
  }

  void  _getImageCamera(GetImageFromCamera event, Emitter<ImagePickerState> emit)async{

    XFile? file = await imagePicker.pickImageCamera();
    emit(state.copyWith(file: file));
  }


}