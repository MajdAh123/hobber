import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobbertest/bloc/todos_bloc.dart';
import 'package:hobbertest/models/todo.dart';
import 'package:hobbertest/pages/tododetails_page.dart';

class CurvedListItem extends StatelessWidget {
  CurvedListItem({
    required this.todo,
    required this.color,
    required this.nextColor,
  });

  final Todo todo;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TodoDetailsPage(
                      todo: todo,
                    )));
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          BlocProvider.of<TodosBloc>(context)
              .add(DeletTodosEvent(todoId: todo.id));
        },
        child: Container(
          color: nextColor,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80.0),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 32,
              top: 50.0,
              bottom: 50,
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        todo.description,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        todo.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        todo.img_link,
                        width: 50,
                        scale: 1,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/1200px-Error.svg.png",
                            width: 50,
                          );
                        },
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
