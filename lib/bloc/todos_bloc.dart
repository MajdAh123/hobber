import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hobbertest/api/todo_api.dart';
import 'package:hobbertest/models/todo.dart';
part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosApi todosApi;
  String errormessage = '';
  TodosBloc({required this.todosApi}) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await todosApi.getAllTodos();
          emit(LoadedState(todos));
        } catch (e) {
          emit(const ErrorState(
              "Something Went Wrong, Please Try Again Later !"));
        }
      } else if (event is AddTodosEvent) {
        emit(LoadingState());
        try {
          errormessage = await todosApi.insertTodo(event.todo);
          final todos = await todosApi.getAllTodos();

          emit(LoadedState(todos));
        } catch (e) {
          emit(ErrorState(errormessage));
        }
      } else if (event is DeletTodosEvent) {
        try {
          errormessage = await todosApi.deleteTodo(event.todoId);
        } catch (e) {
          emit(ErrorState(errormessage));
        }
      } else if (event is UpdateTodosEvent) {
        emit(LoadingState());
        try {
          errormessage = await todosApi.updateTodo(event.todo);
          final todos = await todosApi.getAllTodos();

          emit(LoadedState(todos));
        } catch (e) {
          emit(ErrorState(errormessage));
        }
      }
    });
  }
}
