

import 'package:bloc/bloc.dart';
import 'package:blocs/bloc/counterBloc/counter_event.dart';
import 'package:blocs/bloc/counterBloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() :super(CounterState()){
    on<CounterIncrement>(_increment);
    on<CounterDecrement>(_decrement);
  }
  void _increment(CounterIncrement event , Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter +1));
  }
  void _decrement(CounterDecrement event , Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter -1));
  }
}