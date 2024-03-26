
import 'package:equatable/equatable.dart';

class DateAndTimeState extends Equatable{

  final String? time;
  DateTime? selectDate = DateTime.now();
  
   DateAndTimeState({this.time , this.selectDate});

  DateAndTimeState copyWith(String? time){
    return DateAndTimeState(time: this.time ?? time,selectDate: selectDate);
  }
  
  @override
  List<Object?> get props => [time,selectDate];
}