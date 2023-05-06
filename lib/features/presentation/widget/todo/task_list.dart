import 'package:flutter/material.dart';
import 'package:lecture_app/core/utils/app_colors.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;

  TaskTile(
      {required this.isChecked,
        required this.taskTitle,
        required this.checkboxChange,
        required this.listTileDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        leading: Checkbox(
          activeColor: AppColors.primary,
          value: isChecked,
          onChanged: checkboxChange,
        ),
        trailing: IconButton(icon: Icon(Icons.highlight_remove_rounded),onPressed: listTileDelete,),

      ),
    );
  }
}
