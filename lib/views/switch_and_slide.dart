import 'package:blocs/bloc/switchBloc/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchAndSlide extends StatefulWidget {
  const SwitchAndSlide({super.key});

  @override
  State<SwitchAndSlide> createState() => _SwitchAndSlideState();
}

class _SwitchAndSlideState extends State<SwitchAndSlide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                value: state.isSwitch,
                onChanged: (newValue) {
                  context.read<SwitchBloc>().add(SwitchEnableAndDisable());
                },
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration:
                        BoxDecoration(color: Colors.indigo.withOpacity(state.progressValue)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Slider(
                    value: state.progressValue,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(SliderChangeValue(value: value));
                    },
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
