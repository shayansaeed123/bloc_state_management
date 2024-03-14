
import 'package:equatable/equatable.dart';

class TodoState extends Equatable{

  final List todos;
  const TodoState({this.todos = const []});

  TodoState copyWith({List? todos}){
    return TodoState(todos: todos ?? this.todos);
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [todos];
}