import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/core/utils/media_query_values.dart';
import 'package:lecture_app/features/presentation/widget/todo/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:lecture_app/features/modules/todo/task_data.dart';
import 'add_task_screen.dart';


class TaskScreen extends StatelessWidget {
  var task="Tasks".tr;

  @override
  Widget build( context) {
    var b=context.bottompadding;
    return Scaffold(
      appBar:AppBar(

        title:  Text('ToDo'.tr,style: TextStyle(fontSize: AppStrings.app_header),),
        backgroundColor:AppColors.primary ,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.playlist_add_check),
              Text(
                '${Provider.of<TaskData>(context).tasks.length}$task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: AppStrings.primaryFont,
                ),
              ),
            ],
          ),
        ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        width:600,
        height: 600,
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width*.5,
              height: MediaQuery.of(context).size.width*.11,
              color: AppColors.primary,
              shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10)
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    child: AddTaskScreen((newTaskTitle) {
                    }),
                  ),
                );
              },
              child: Text(
                "New task".tr,
                style: TextStyle(
                    fontFamily: AppStrings.constantFont,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
