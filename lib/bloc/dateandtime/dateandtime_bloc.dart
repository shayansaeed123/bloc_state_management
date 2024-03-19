
import 'package:blocs/bloc/dateandtime/dateandtime_event.dart';
import 'package:blocs/bloc/dateandtime/dateandtime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateAndTimeBloc extends Bloc<DateAndTimeEvent, DateAndTimeState>{
  
  DateAndTimeBloc() :super(DateAndTimeState()){
    on<ShowTime>(_showTime);
    on<SelectDateAndTime>(_selectTimeAndDate);
  }

  void _showTime(DateAndTimeEvent event, Emitter<DateAndTimeState> emint){
    DateTime now = DateTime.now();
    String timeStr = "${now.hour}:${now.minute}:${now.second}";
    emint(DateAndTimeState(time: timeStr));
  }

  void _selectTimeAndDate(DateAndTimeEvent event, Emitter<DateAndTimeState> emint){
    emint(DateAndTimeState(selectDate: DateTime.now()));
  }
}