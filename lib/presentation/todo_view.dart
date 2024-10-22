import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todoey_blocs/domain/models/todo.dart';
import 'package:flutter_todoey_blocs/presentation/bloc/todo_bloc.dart';
import 'package:flutter_todoey_blocs/presentation/bloc/todo_event.dart';
import 'package:flutter_todoey_blocs/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodoBox(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      todoBloc.add(AddTodo(textController.text));
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoBox(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final todo = state[index];

              return ListTile(
                title: Text(todo.text),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    todoBloc.add(ToggleCompletion(todo));
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => todoBloc.add(DeleteTodo(todo)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
