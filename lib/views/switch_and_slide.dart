import 'dart:async';

import 'package:blocs/bloc/dateandtime/dateandtime_bloc.dart';
import 'package:blocs/bloc/dateandtime/dateandtime_event.dart';
import 'package:blocs/bloc/dateandtime/dateandtime_state.dart';
import 'package:blocs/bloc/switchBloc/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SwitchAndSlide extends StatefulWidget {
  const SwitchAndSlide({super.key});

  @override
  State<SwitchAndSlide> createState() => _SwitchAndSlideState();
}

class _SwitchAndSlideState extends State<SwitchAndSlide> {
  late Timer _timer;
  //  late TimeOfDay selectedTime = TimeOfDay.now() ;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  DateFormat formattedDate = DateFormat('yyyy-MM-dd');
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      context.read<DateAndTimeBloc>().add(ShowTime());
    });
  }

  @override
  Widget build(BuildContext context) {
    print('object');
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
                    decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(state.progressValue)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Slider(
                    value: state.progressValue,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderChangeValue(value: value));
                    },
                  )
                ],
              );
            },
          ),
          BlocBuilder<DateAndTimeBloc, DateAndTimeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text('Time'),
                  Text('Selected Time: ${selectedTime.format(context)}' ??
                      state.time.toString()),
                  ElevatedButton(
                      onPressed: () async {
                        print('time');
                        final TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            initialEntryMode: TimePickerEntryMode.dial);
                        if (time != null) {
                          selectedTime = time;
                          setState(() {});
                          context.read<DateAndTimeBloc>().add(ShowTime());
                        }
                      },
                      child: Icon(Icons.calendar_month)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Date'),
                  Text('Selected Date: ${formattedDate.format(selectedDate)}' ??
                      state.selectDate.toString()),
                  ElevatedButton(
                      onPressed: () async {
                        print('Data');
                        final DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                          initialDatePickerMode: DatePickerMode.day,
                        );
                        if (date != null) {
                          selectedDate = date;
                          setState(() {});
                          context
                              .read<DateAndTimeBloc>()
                              .add(SelectDateAndTime());
                        }
                      },
                      child: Icon(Icons.calendar_month)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
