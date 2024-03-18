
import 'package:equatable/equatable.dart';

class DateAndTimeState extends Equatable{

  final String? time;
  
  const DateAndTimeState({this.time});

  DateAndTimeState copyWith(String? time){
    return DateAndTimeState(time: this.time ?? time);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [time];
}