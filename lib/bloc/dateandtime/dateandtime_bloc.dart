
import 'package:blocs/bloc/dateandtime/dateandtime_event.dart';
import 'package:blocs/bloc/dateandtime/dateandtime_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateAndTimeBloc extends Bloc<DateAndTimeEvent, DateAndTimeState>{
  
  DateAndTimeBloc() :super(const DateAndTimeState()){
    on<ShowTime>(_showTime);
  }

  void _showTime(DateAndTimeEvent event, Emitter<DateAndTimeState> emint){
    DateTime now = DateTime.now();
    String timeStr = "${now.hour}:${now.minute}:${now.second}";
    emint(DateAndTimeState(time: timeStr));
  }
}