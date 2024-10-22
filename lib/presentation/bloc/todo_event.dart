import 'package:flutter_todoey_blocs/domain/models/todo.dart';

sealed class TodoBlocEvent {}

final class LoadTodos extends TodoBlocEvent {}

final class AddTodo extends TodoBlocEvent {
  final String newTodoTitle;
  AddTodo(this.newTodoTitle);
}

final class DeleteTodo extends TodoBlocEvent {
  final Todo deleteTodo;
  DeleteTodo(this.deleteTodo);
}

final class ToggleCompletion extends TodoBlocEvent {
  final Todo updateTodo;
  ToggleCompletion(this.updateTodo);
}
