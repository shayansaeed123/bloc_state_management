part of 'random_number_bloc.dart';

class RandomNumberState extends Equatable {
  final int randomNumber;

  const RandomNumberState({this.randomNumber = 0});

  RandomNumberState copyWith(int? randomNumber){
    return  RandomNumberState(randomNumber: randomNumber ?? this.randomNumber);
  }
  @override
  List<Object> get props => [randomNumber];
}


