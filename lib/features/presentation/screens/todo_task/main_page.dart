import 'package:flutter/material.dart';
import 'package:lecture_app/features/modules/todo/task_data.dart';
import 'tasks_screen.dart';
import 'package:provider/provider.dart';

class Begin_tasks extends StatelessWidget {
  const Begin_tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
