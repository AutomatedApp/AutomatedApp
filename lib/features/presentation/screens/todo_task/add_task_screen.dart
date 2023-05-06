import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/features/modules/todo/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
 static Color? backgroundColor;

  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    Color? backgroundColor;
    return Container(

      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15,),

          TextField(
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18)
              ),
              enabled: true,
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 8.0, top: 8.0),
              hintText: 'Tab "Enter" to create your tasks',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
          ),
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            child: Text('Add'.tr,),
            style: TextButton.styleFrom(
             textStyle: TextStyle(
               fontSize: 25
             ),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
