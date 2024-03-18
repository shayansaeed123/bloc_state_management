import 'package:equatable/equatable.dart';

abstract class DateAndTimeEvent extends Equatable{
  const DateAndTimeEvent();

  List<Object?> get props => [];
}

class ShowTime extends  DateAndTimeEvent {}