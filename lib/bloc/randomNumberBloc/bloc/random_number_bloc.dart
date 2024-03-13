import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_number_event.dart';
part 'random_number_state.dart';

// class RandomNumberBloc extends Bloc<RandomNumberEvent, RandomNumberState> {
//   RandomNumberBloc() : super(RandomNumberState()) {
//     on<RandomNumberEvent>(_randomNumber);
//   }

//   void _randomNumber(GetRandomNumber event, Emitter<RandomNumberState> emit){
//     final  random = Random();
//     final randomNumber = random.nextInt(100);
//     emit(state.copyWith(randomNumber));
//   }
// }

class RandomNumberBloc extends Bloc<RandomNumberEvent, RandomNumberState> {
  RandomNumberBloc() : super(RandomNumberState()) {
    on<GetRandomNumber>(_mapEventToState);
  }

  void _mapEventToState(GetRandomNumber event, Emitter<RandomNumberState> emit) {
    final random = Random();
    final randomNumber = random.nextInt(100);
    emit(RandomNumberState(randomNumber: randomNumber));
  }
}

