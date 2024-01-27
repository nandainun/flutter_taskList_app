import 'package:flutter/material.dart';

import '../models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return TaskTile(task: task);
        },
      ),
    );
  }
}
