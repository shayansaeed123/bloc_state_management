// import 'package:blocs/bloc/counterBloc/counter_bloc.dart';
// import 'package:blocs/bloc/counterBloc/counter_event.dart';
// import 'package:blocs/bloc/counterBloc/counter_state.dart';
import 'package:blocs/bloc/randomNumberBloc/bloc/random_number_bloc.dart';
import 'package:blocs/res/reusablebtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter_Screen extends StatefulWidget {
  const Counter_Screen({super.key});

  @override
  State<Counter_Screen> createState() => _Counter_ScreenState();
}

class _Counter_ScreenState extends State<Counter_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Ex'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<RandomNumberBloc, RandomNumberState>(
            builder: (context, state) {
              // if(state is RandomNumberState){
              return Center(child: Text(state.randomNumber.toString(), style:  const TextStyle(fontSize: 30),),);
              // }
              // else{
              //   return Text('data');
              // }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              reusablebtn((){
                context.read<RandomNumberBloc>().add(GetRandomNumber());
              }, 'increment'),
              reusablebtn(() {
                // context.read<CounterBloc>().add(CounterDecrement());
              },'decrement')
            ],
          )
        ],
      ),
    );
  }
}