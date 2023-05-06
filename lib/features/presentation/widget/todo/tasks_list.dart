import 'package:flutter/material.dart';
import 'package:lecture_app/features/presentation/widget/todo/task_list.dart';
import 'package:provider/provider.dart';
import 'package:lecture_app/features/modules/todo/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.separated(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkboxChange: (newValue) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                listTileDelete: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            }, separatorBuilder: (context, index)=>SizedBox(
            height: 10,
          ),
          );
        },
      ),
    );
  }
}
