import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobbertest/api/todo_api.dart';
import 'package:hobbertest/bloc/todos_bloc.dart';
import 'package:hobbertest/pages/todos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => TodosBloc(todosApi: TodosApi())
      //   ..add(const TodosEvent.()),
      create: (context) =>
          TodosBloc(todosApi: TodosApi())..add(GetAllTodosEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todos App',
        home: TodosPage(),
      ),
    );
  }
}
