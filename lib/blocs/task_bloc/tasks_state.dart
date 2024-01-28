// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> completedTask;
  final List<Task> favoriteTask;
  final List<Task> removedTask;
  const TasksState({
    this.pendingTask = const <Task>[],
    this.completedTask = const <Task>[],
    this.favoriteTask = const <Task>[],
    this.removedTask = const <Task>[],
  });

  @override
  List<Object> get props => [
        pendingTask,
        completedTask,
        favoriteTask,
        removedTask,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': pendingTask.map((x) => x.toMap()).toList(),
      'completedTask': completedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTask:
          List<Task>.from(map['pendingTask']?.map((x) => Task.fromMap(x))),
      completedTask:
          List<Task>.from(map['completedTask']?.map((x) => Task.fromMap(x))),
      favoriteTask:
          List<Task>.from(map['favoriteTask']?.map((x) => Task.fromMap(x))),
      removedTask:
          List<Task>.from(map['removedTask']?.map((x) => Task.fromMap(x))),
    );
  }
}
