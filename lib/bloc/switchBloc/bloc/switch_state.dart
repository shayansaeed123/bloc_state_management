part of 'switch_bloc.dart';

class SwitchState extends Equatable {

  final bool isSwitch;
  final double  progressValue;
  const SwitchState({this.isSwitch = false, this.progressValue = 0.0});

  SwitchState copyWith({bool? isSwitch, double? progressValue}){
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      progressValue: progressValue ?? this.progressValue
    );
  }
  
  @override
  List<Object> get props => [isSwitch,progressValue];
}


