import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobbertest/bloc/todos_bloc.dart';
import 'package:hobbertest/constant/colors.dart';
import 'package:hobbertest/models/todo.dart';
import 'package:hobbertest/pages/tododetails_page.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/todos_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: const Text("Todos"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kBackgroundColor,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TodoDetailsPage(
                      todo: Todo(
                          id: -1,
                          title: "",
                          description: "",
                          img_link: "",
                          email: ""),
                    )));
          },
        ),
        body: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is LoadedState) {
              List<Todo> alltodos = state.todos.reversed.toList();
              return TodosWidget(todos: alltodos);
            } else if (state is ErrorState) {
              return MyErrorWidget(message: state.message);
            } else {
              return const LoadingWidget();
            }
          },
        ));
  }
}
