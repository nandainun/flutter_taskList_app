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
      allTasks: List.from(state.allTasks)..add(event.task),
      removedTask: state.removedTask,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TasksState(
      allTasks: allTasks,
      removedTask: state.removedTask,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      allTasks: state.allTasks,
      removedTask: List.from(state.removedTask)..remove(event.task),
    ));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
      allTasks: List.from(state.allTasks)..remove(event.task),
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
