import 'package:blocs/bloc/api/api_bloc.dart';
import 'package:blocs/bloc/api/get_api_bloc.dart';
import 'package:blocs/bloc/counterBloc/counter_bloc.dart';
import 'package:blocs/bloc/dateandtime/dateandtime_bloc.dart';
import 'package:blocs/bloc/imagePicker/image_picker_bloc.dart';
import 'package:blocs/bloc/randomNumberBloc/bloc/random_number_bloc.dart';
import 'package:blocs/bloc/switchBloc/bloc/switch_bloc.dart';
import 'package:blocs/bloc/todo/todo_bloc.dart';
import 'package:blocs/utils/imagepicker.dart';
import 'package:blocs/views/get_api_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MyApp()
    // DevicePreview(
    //  enabled: true, 
    // builder: (context) => const MyApp(), )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(),),
        BlocProvider(create: (context) => RandomNumberBloc(),),
        BlocProvider(create: (context) => SwitchBloc(),),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (context) => TodoBloc(),),
        BlocProvider(create: (context) => DateAndTimeBloc(),),
        BlocProvider(create: (context) => PostBloc(),),
        BlocProvider(create: (context) => GetAPiBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: GetApiScreen(),
      ),
    );
  }
}
