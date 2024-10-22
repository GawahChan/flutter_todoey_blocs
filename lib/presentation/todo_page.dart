import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todoey_blocs/domain/repository/todo_repo.dart';
import 'package:flutter_todoey_blocs/presentation/bloc/todo_bloc.dart';
import 'package:flutter_todoey_blocs/presentation/bloc/todo_event.dart';
import 'package:flutter_todoey_blocs/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(todoRepo)..add(LoadTodos()),
      child: const TodoView(),
    );
  }
}
