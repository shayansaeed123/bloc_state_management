
import 'package:bloc/bloc.dart';
import 'package:blocs/bloc/todo/todo_event.dart';
import 'package:blocs/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  List<String> todos = [];
  TodoBloc() : super(TodoState()){
    on<AddTodoEvent>(_addTodo);
  }
  void  _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todos.add(event.task);
    emit(state.copyWith(todos: List.from(todos)));
  }
}