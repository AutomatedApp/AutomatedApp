import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/core/utils/local/local_controller.dart';
import 'package:lecture_app/features/presentation/screens/students%20attendance/Attendance.dart';
import 'package:lecture_app/features/presentation/screens/Projector/DataShow_test.dart';
import 'package:lecture_app/features/presentation/screens/Notify%20Students/Notify.dart';
import 'package:lecture_app/features/presentation/screens/Quiz%20Pages/Quiz.dart';
import 'package:lecture_app/features/presentation/screens/aboutApp/about_app.dart';
import 'package:lecture_app/features/presentation/screens/account_page/information_screen.dart';
import 'package:lecture_app/features/presentation/screens/nav_bottom_screens/nav_home.dart';
import 'package:lecture_app/features/presentation/screens/settings_page/setting_screen.dart';
import 'package:lecture_app/features/presentation/widget/settins_tile.dart';
import 'package:lecture_app/features/presentation/screens/record%20lecture/Start_record.dart';
import 'package:lecture_app/features/presentation/screens/splash_screen/splash_screen.dart';
import 'package:lecture_app/features/presentation/widget/item.dart';
import 'upload content/Upload_files.dart';
import 'package:lecture_app/core/utils/network/local_network.dart';
class HomePage extends StatefulWidget {
  static final ROUTE='HomePage';
  static Future<bool> logoutuser() async {

    var email= cashNetwork.getCashData(key: "email");
    var token= cashNetwork.getCashData(key: "token");
    if(email!=null && token!=null){
      cashNetwork.removeFromCash(key: "email");
      cashNetwork.removeFromCash(key: "token");
      return true;
    }else{
      return false;
    }
  }
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  bool lang=true;
  MyLocaleController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var name=cashNetwork.getCashData(key: "name");
    return Scaffold(

      drawer: Drawer(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView(
            children: [
              DrawerHeader(
                child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CircleAvatar(radius: 50,
                      backgroundImage:  FileImage( File(cashNetwork.getCashData(key: "image_profile"))),),
                  ),
                  Text(name!=""?'${cashNetwork.getCashData(key: "name")}':"User",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.primaryFont,
                    color: Colors.grey,
                  ),
                  ),
                ],
              ),
              ),
              SizedBox(height: 30,),
              SettingsTile(
                color: AppColors.primary,
                icon: Icons.person,
                title: "Account".tr,
                onTap: () {
                  Navigator.pushNamed(context,InformationScreen.ROUTE);
                },
              ),
              Divider(
                color: Colors.grey,
                height: 30,
                endIndent: 4,
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    lang?"English":"اللغه العربية ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Switch(value: lang, onChanged: (value){
                    setState(() {
                      lang = !lang;
                      if (lang == false) {
                        controller.changeLang("ar");
                      }
                      else {
                        controller.changeLang("en");
                      }
                    });
                  }),
                ],
              ),
              Divider(
                color: Colors.grey,
                height: 30,
              ),
              SettingsTile(
                color: AppColors.primary,
                icon:  Icons.settings,
                title: 'Settings'.tr,
                onTap: ()=>Navigator.pushNamed(context,SettingsScreen.ROUTE),
              ),
              SizedBox(height: 50,),
              TextButton.icon(

                icon: Icon(Icons.person,color: AppColors.primary,),
                onPressed: (){
                  HomePage.logoutuser();
                  Navigator.pushNamedAndRemoveUntil(context,SplshScreen.ROUTE,(route)=>false);
                },
                label: Text(
                  "LogOut".tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.primaryFont,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],

      ),
        ),
      ),
      appBar: AppBar(
        title:  Text('Home'.tr,style: TextStyle(
          fontSize: AppStrings.app_header,
        ),
        ),
        backgroundColor:AppColors.primary ,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top:55,left: 25,right: 25),
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    cards(context: context,pushNamed: DataShow.ROUTE,text:'Projector',icon_path: ImageAssets.tablet ),
                    cards(context: context,pushNamed: UploadFiles.ROUTE,text:'Upload',icon_path:ImageAssets.upload ),
                    cards(context: context,pushNamed: AttendanceList.ROUTE,text:'Attandance',icon_path: ImageAssets.immigration ),
                    cards(context: context,pushNamed: QuizPage.ROUTE,text:'Quiz',icon_path:ImageAssets.quiz),
                  ],
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing:50,crossAxisSpacing: 25,)
                  ,),
              ),
            ),
            Container(
              width: 220,
              height: 220,
              child: Padding(
              padding: const EdgeInsets.only(top:50,left: 25,right: 25),
                child: GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context,notify.ROUTE),
                    child:   Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),

                        color: AppColors.card,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.homePage,
                            spreadRadius: 7,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image:  AssetImage(ImageAssets.notification),
                            height: 60,
                          ),
                          Text('Notify'.tr,
                            style: TextStyle(fontSize: 20, fontFamily:AppStrings.primaryFont),
                          ),

                        ],
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),),
    );
  }
}


