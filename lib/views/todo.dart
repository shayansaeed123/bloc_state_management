import 'package:blocs/bloc/todo/todo_bloc.dart';
import 'package:blocs/bloc/todo/todo_event.dart';
import 'package:blocs/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle:  true,
      ),
      body: Column(children: [
        BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.todos.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }else if(state.todos.isNotEmpty){
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {     
                return ListTile(
                  title: Text(state.todos[index]),
                );
            },);
          }else{
            return Container();
          }
        },)
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           for(int i = 0; i <= 10; i++){
            context.read<TodoBloc>().add(AddTodoEvent(task: i.toString()));
           }
        }
      ),
    );
  }
}