import 'package:flutter/cupertino.dart';
import 'package:lecture_app/features/presentation/screens/students%20attendance/Attendance.dart';
import 'package:lecture_app/features/presentation/screens/Projector/DataShow_test.dart';
import 'package:lecture_app/features/presentation/screens/HomePage.dart';
import 'package:lecture_app/features/presentation/screens/Quiz%20Pages/Quiz.dart';
import 'package:lecture_app/features/presentation/screens/upload%20content/Upload_files.dart';
import 'package:lecture_app/features/presentation/screens/aboutApp/about_app.dart';
import 'package:lecture_app/features/presentation/screens/account_page/change_password.dart';
import 'package:lecture_app/features/presentation/screens/account_page/information_screen.dart';
import 'package:lecture_app/features/presentation/screens/account_page/profile_screen.dart';
import 'package:lecture_app/features/presentation/screens/login_screen/ResetPassword.dart';
import 'package:lecture_app/features/presentation/screens/login_screen/login_screen.dart';
import 'package:lecture_app/features/presentation/screens/nav_bottom_screens/nav_home.dart';
import 'package:lecture_app/features/presentation/screens/settings_page/setting_screen.dart';
import 'package:lecture_app/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:lecture_app/features/presentation/screens/Notify%20Students/Notify.dart';
import 'package:lecture_app/features/presentation/screens/login_screen/ResetPassword.dart';
import 'package:lecture_app/features/presentation/screens/record%20lecture/Start_record.dart';
import 'package:lecture_app/features/presentation/screens/record%20lecture/Record_page.dart';

Map<String,WidgetBuilder> routes={
  SplshScreen.ROUTE:(c)=>SplshScreen(),
  ResetPassword.ROUTE:(c)=>ResetPassword(),
  NavHome.ROUTE:(c)=>NavHome(),
  ChangePassword.ROUTE:(c)=>ChangePassword(),
  InformationScreen.ROUTE:(c)=>InformationScreen(),
  AccountScreen.ROUTE:(c)=>AccountScreen(),
  UploadFiles.ROUTE:(c)=>UploadFiles(),
  HomePage.ROUTE:(c)=>HomePage(),
  notify.ROUTE:(c)=>notify(),
  AboutApp.ROUTE:(c)=>AboutApp(),
  AttendanceList.ROUTE:(c)=>AttendanceList(),
  DataShow.ROUTE:(c)=>DataShow(),
  LoginScreen.ROUTE:(c)=>LoginScreen(),
  ResetPassword.ROUTE:(c)=>ResetPassword(),
  SettingsScreen.ROUTE:(c)=>SettingsScreen(),
  QuizPage.ROUTE:(c)=>QuizPage(),
  RecordPage.ROUTE:(c)=>RecordPage(),
  record.ROUTE:(c)=>record(),
};