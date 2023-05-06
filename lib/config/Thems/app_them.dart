
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';

ThemeData appthem(){
return ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor:AppColors.primary,
        titleTextStyle: TextStyle(fontFamily: AppStrings.primaryFont,fontSize: 25)
    )
);
}
ThemeData lightthem()=>ThemeData(

    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
        ),
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(

        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,

    ) ,
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,

        ),

    ),


    primarySwatch: Colors.deepPurple,
);
ThemeData darkthem()=>ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    bottomAppBarTheme:BottomAppBarTheme(
        color: AppColors.primary,

    ) ,
    drawerTheme: DrawerThemeData(

        backgroundColor:Colors.black,
        scrimColor: Colors.black38,

    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        shape: OutlineInputBorder(borderRadius: BorderRadius.vertical(bottom:Radius.circular(35) ,),),
        titleSpacing: 20.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: AppStrings.constantFont,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: AppColors.primary,
        backwardsCompatibility: false,

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,

        ),

    ),
    primarySwatch: Colors.deepPurple,

);