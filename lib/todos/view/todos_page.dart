import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram_clone/todos/cubit/todos_cubit.dart';

// We need to ensure that our TodosCubit (our state) is accessible only inside
// the children of the TodosPage and no other widgets.

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(
        apiRepository: context.read<ApiRepository>(),
      ),
      child: const TodosView(),
    );
  }
}

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodosView> {
  @override
  void initState() {
    super.initState();
    context.read<TodosCubit>().fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.select((TodosCubit cubit) => cubit.state);

    log("Todo's: $todos");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Text(
                    todo,
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
