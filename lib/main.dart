import 'package:blocs/bloc/counterBloc/counter_bloc.dart';
import 'package:blocs/bloc/randomNumberBloc/bloc/random_number_bloc.dart';
import 'package:blocs/bloc/switchBloc/bloc/switch_bloc.dart';
import 'package:blocs/views/counter_screen.dart';
import 'package:blocs/views/switch_and_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomNumberBloc(),
      child: BlocProvider(
        create: (context) => SwitchBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SwitchAndSlide(),
        ),
      ),
    );
  }
}
