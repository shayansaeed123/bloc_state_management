
import 'package:bloc/bloc.dart';
import 'package:blocs/bloc/todo/todo_event.dart';
import 'package:blocs/bloc/todo/todo_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  late SharedPreferences _prefs;
  List<String> todos = [];
  TodoBloc() : super(TodoState()){
    initSharedPreferences();
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }
  void initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTodos = _prefs.getStringList('todos');
    if (savedTodos != null) {
      todos = savedTodos;
      // ignore: invalid_use_of_visible_for_testing_member
      emit(state.copyWith(todos: List.from(todos)));
    }
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todos.add(event.task);
    _saveToSharedPreferences();
    emit(state.copyWith(todos: List.from(todos)));
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todos.remove(event.task);
    _saveToSharedPreferences();
    emit(state.copyWith(todos: List.from(todos)));
  }

  void _saveToSharedPreferences() {
    _prefs.setStringList('todos', todos);
  }
}