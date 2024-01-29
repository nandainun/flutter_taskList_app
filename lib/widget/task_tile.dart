import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDelete!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.star_outline),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      Text(
                        DateFormat().add_yMEd().format(DateTime.now()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: task.isDone,
            onChanged: task.isDelete == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.bookmark),
                  label: const Text('Add to bookmarks'),
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.delete),
                  label: const Text('Edit'),
                ),
                onTap: () => _removeOrDeleteTask(context, task),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ListTile(
//       title: 
//       ),
//       trailing: 
//     );
