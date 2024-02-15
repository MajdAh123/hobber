// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodosEvent extends TodosEvent {}

class AddTodosEvent extends TodosEvent {
  final Todo todo;
  const AddTodosEvent({required this.todo});
}

class DeletTodosEvent extends TodosEvent {
  final int todoId;
  const DeletTodosEvent({required this.todoId});
}

class UpdateTodosEvent extends TodosEvent {
  final Todo todo;
  const UpdateTodosEvent({required this.todo});
}

class GetTodoDetailEvent extends TodosEvent {
  final int todoId;
  const GetTodoDetailEvent({
    required this.todoId,
  });

  @override
  List<Object> get props => [todoId];
}
