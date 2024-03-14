import 'dart:io';

import 'package:blocs/bloc/imagePicker/image_picker_bloc.dart';
import 'package:blocs/bloc/imagePicker/image_picker_event.dart';
import 'package:blocs/bloc/imagePicker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
           if(state.file == null ){
             return InkWell(
                onTap: () {
                  // context.read<ImagePickerBloc>().add(GetImageFromCamera());
                  // context.read<ImagePickerBloc>().add(GetImageFromGallery());
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        title: Text('Select Image Source'),
                        content:
                            Text('Do you want to pick from camera or gallery?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              context
                                  .read<ImagePickerBloc>()
                                  .add(GetImageFromCamera());
                            },
                            child: Text('Camera'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              context
                                  .read<ImagePickerBloc>()
                                  .add(GetImageFromGallery());
                            },
                            child: Text('Gallery'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.image,
                  size: 50,
                ));
           }else{
            return Image.file(File(state.file!.path.toString()));
           }
          },
        )),
      ],
    ));
  }
}
