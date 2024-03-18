import 'package:blocs/bloc/todo/todo_bloc.dart';
import 'package:blocs/bloc/todo/todo_event.dart';
import 'package:blocs/bloc/todo/todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle:  true,
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<TodoBloc, TodoState>(
            buildWhen: (previous, current) =>  previous.todos != current.todos,
            builder: (context, state) {
            if (state.todos.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }else{
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {     
                  return ListTile(
                    title: Text(state.todos[index]),
                    trailing: InkWell(
                      onTap: (){
                        context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todos[index]));
                        print('remove');
                      },
                      child: Icon(Icons.delete_forever)),
                  );
              },);
            }
          },),
        )
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  for(int i = 0; i <= 10; i++){
          //   context.read<TodoBloc>().add(AddTodoEvent(task: i.toString()));
          //  }
          showCupertinoDialog(context: context, builder: (context) {
            return CupertinoAlertDialog(
              content: Padding(
                padding: EdgeInsets.all(24.0),
                child: CupertinoTextField(controller: _textFieldController, autofocus: true,),
              ),
              actions: [ElevatedButton(onPressed: (){
                String task = _textFieldController.text;
                if(task.isNotEmpty) {
                  Navigator.pop(context);
                  context.read<TodoBloc>().add(AddTodoEvent(task: task));
                  print('add');
                  _textFieldController.clear();
                } else {
                }
              }, child: Text('Ok'))],);
          },);
        }
      ),
    );
  }
}