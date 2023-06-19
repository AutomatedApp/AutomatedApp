import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
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
  int currentTab = 1;
  List<Widget> body=[
    Statistics(),
    HomePage(),
    Begin_tasks()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        height: 75,

        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CurvedNavigationBar(
              height: 50,
              index: currentTab,
              backgroundColor: AppColors.primary,
              color: AppColors.primary,
              buttonBackgroundColor: Colors.white,
              onTap:(index){
            setState(() {
              currentTab=index;
            });
            currentScreen=body[index];
          },
              items:
              <Widget>[

                Icon(
                  Icons.bar_chart,
                ),
                Icon(
                  Icons.home,),
                Icon(
                  Icons.list_alt_outlined,
                ),

              ]),

        ),

      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }
}
