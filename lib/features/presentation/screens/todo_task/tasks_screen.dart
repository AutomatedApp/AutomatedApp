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

        title:  Text('ToDo'.tr),
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
      backgroundColor: Colors.grey.withOpacity(0.2),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 158),
        child: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom
                  ),
                  child: AddTaskScreen((newTaskTitle) {
                    // setState(() {
                    //   tasks.add(Task(name: newTaskTitle));
                    //   Navigator.pop(context);
                    // });
                  }),
                ),
              ),
            );
          },
          backgroundColor: AppColors.primary,
          label: Text("New task".tr,style: TextStyle(fontFamily:AppStrings.primaryFont ),),
          icon: Icon(Icons.add),
        ),
      ),
      body: Container(
        width:500,
        height: 500,
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
