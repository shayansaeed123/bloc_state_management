part of 'random_number_bloc.dart';

abstract class RandomNumberEvent extends Equatable {
  const RandomNumberEvent();

  @override
  List<Object> get props => [];
}

class  GetRandomNumber extends RandomNumberEvent {}
