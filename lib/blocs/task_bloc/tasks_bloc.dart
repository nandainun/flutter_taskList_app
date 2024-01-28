// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTask: List.from(state.pendingTask)..add(event.task),
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      removedTask: state.removedTask,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTask = state.pendingTask;
    List<Task> completedTask = state.completedTask;
    task.isDone == false
        ? {
            pendingTask = List.from(pendingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pendingTask = List.from(pendingTask)
              ..insert(0, task.copyWith(isDone: false))
          };

    emit(TasksState(
      pendingTask: pendingTask,
      completedTask: completedTask,
      favoriteTask: state.favoriteTask,
      removedTask: state.removedTask,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      pendingTask: state.pendingTask,
      completedTask: state.completedTask,
      favoriteTask: state.favoriteTask,
      removedTask: List.from(state.removedTask)..remove(event.task),
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      pendingTask: List.from(state.pendingTask)..remove(event.task),
      completedTask: List.from(state.completedTask)..remove(event.task),
      favoriteTask: List.from(state.favoriteTask)..remove(event.task),
      removedTask: List.from(state.removedTask)
        ..add(event.task.copyWith(isDelete: true)),
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
