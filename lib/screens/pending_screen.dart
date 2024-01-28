import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widget/tasks_list.dart';

// ignore: must_be_immutable
class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({super.key});
  static const id = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTask;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                    '${taskList.length} Task | ${state.completedTask.length} Completed'),
              ),
            ),
            TasksList(taskList: taskList)
          ],
        );
      },
    );
  }
}
