import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widget/tasks_list.dart';

// ignore: must_be_immutable
class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${taskList.length} Task'),
              ),
            ),
            TasksList(taskList: taskList)
          ],
        );
      },
    );
  }
}
