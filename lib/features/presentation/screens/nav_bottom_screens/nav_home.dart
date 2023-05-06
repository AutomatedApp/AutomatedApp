import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/features/presentation/screens/HomePage.dart';
import 'package:lecture_app/features/presentation/screens/Statistics%20Page/Statistics.dart';
import 'package:lecture_app/features/presentation/screens/todo_task/main_page.dart';

class NavHome extends StatefulWidget {
  static final ROUTE='NavHome';
  const NavHome({Key? key}) : super(key: key);

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar:BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen=Statistics();
                    currentTab =1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      color: currentTab==1? AppColors.primary : Colors.grey,
                    ),
                    Text(
                      'Statistics'.tr,
                      style: TextStyle(
                        color: currentTab==1? AppColors.primary : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentScreen=HomePage();
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentTab==0? AppColors.primary : Colors.grey,
                    ),
                    Text(
                      'Home'.tr,
                      style: TextStyle(
                        color: currentTab==0? AppColors.primary : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 50,
                onPressed: (){
                  setState(() {
                    currentScreen=Begin_tasks();
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list_alt_outlined,
                      color: currentTab==2? AppColors.primary : Colors.grey,
                    ),
                    Text(
                      'ToDo'.tr,
                      style: TextStyle(
                        color: currentTab==2? AppColors.primary : Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
