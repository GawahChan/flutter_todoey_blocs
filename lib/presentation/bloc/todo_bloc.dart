import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todoey_blocs/domain/models/todo.dart';
import 'package:flutter_todoey_blocs/domain/repository/todo_repo.dart';
import 'package:flutter_todoey_blocs/presentation/bloc/todo_event.dart';

class TodoBloc extends Bloc<TodoBlocEvent, List<Todo>> {
  final TodoRepo todoRepo;

  TodoBloc(this.todoRepo) : super([]) {
    LoadTodos();

    on<LoadTodos>((event, emit) async {
      final todoList = await todoRepo.getTodos();
      emit(todoList);
    });

    on<AddTodo>((event, emit) async {
      final newTodo = Todo(
        id: DateTime.now().microsecondsSinceEpoch,
        text: event.newTodoTitle,
      );

      await todoRepo.addTodo(newTodo);
      LoadTodos();
    });

    on<DeleteTodo>((event, emit) async {
      await todoRepo.deleteTodo(event.deleteTodo);
      LoadTodos();
    });

    on<ToggleCompletion>(
      (event, emit) async {
        final updatedTodo = event.updateTodo.toggleCompletion();

        await todoRepo.updateTodo(updatedTodo);
        LoadTodos();
      },
    );
  }
}
