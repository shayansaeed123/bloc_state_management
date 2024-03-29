part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

final class SwitchEnableAndDisable extends SwitchEvent {}
// ignore: must_be_immutable
final class SliderChangeValue extends SwitchEvent {
  double  value;
   SliderChangeValue({required this.value});

   @override
  List<Object> get props => [];
}
