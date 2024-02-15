import 'package:flutter/material.dart';
import 'package:hobbertest/constant/colors.dart';
import 'package:hobbertest/widgets/todocard_widget.dart';

import '../models/todo.dart';

class TodosWidget extends StatelessWidget {
  final List<Todo> todos;
  const TodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return CurvedListItem(
          todo: todos[index],
          color: index.isEven ? kTheredColor : kSecondaryColor,
          nextColor: index.isOdd ? kTheredColor : kSecondaryColor,
        );
      },
    );
  }
}
