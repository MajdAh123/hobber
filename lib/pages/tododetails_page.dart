import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobbertest/bloc/todos_bloc.dart';
import 'package:hobbertest/constant/colors.dart';
import 'package:hobbertest/models/todo.dart';

// ignore: must_be_immutable
class TodoDetailsPage extends StatefulWidget {
  Todo todo;

  TodoDetailsPage({required this.todo});

  @override
  _TodoDetailsPageState createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: buildForm(widget.todo),
        ),
      ),
    );
  }

  Widget buildForm(Todo todo) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Email"),
            initialValue: todo.email,
            onChanged: (value) {
              setState(() {
                todo.email = value;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email cannot be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: "Title"),
            initialValue: todo.title,
            onChanged: (value) {
              setState(() {
                todo.title = value;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Title cannot be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: 6,
            decoration: InputDecoration(labelText: "Description"),
            initialValue: todo.description,
            onChanged: (value) {
              setState(() {
                todo.description = value;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Description cannot be empty';
              }
              return null;
            },
          ),
          SizedBox(
            height: 16,
          ),
          ButtonTheme(
            minWidth: 200,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => kPrimaryColor,
                ),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text(
                widget.todo.id == -1 ? 'Add Todo' : 'Edit Todo',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.todo.id == -1) {
                    BlocProvider.of<TodosBloc>(context)
                        .add(AddTodosEvent(todo: todo));
                  } else {
                    BlocProvider.of<TodosBloc>(context)
                        .add(UpdateTodosEvent(todo: todo));
                  }
                }

                Navigator.pop(context);
                _formKey.currentState!.reset();
              },
            ),
          ),
        ],
      ),
    );
  }
}
