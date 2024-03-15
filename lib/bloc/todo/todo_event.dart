
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{

  const TodoEvent();

  List<Object?> get props => [];

}

class AddTodoEvent extends  TodoEvent {

  final String task;
  const AddTodoEvent({required this.task});

  List<Object?> get props => [task];
}

class RomoveTodoEvent extends TodoEvent{}