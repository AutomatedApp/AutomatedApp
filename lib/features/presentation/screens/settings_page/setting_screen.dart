import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/core/utils/local/local_controller.dart';
import 'package:lecture_app/features/presentation/screens/Projector/DataShow_test.dart';
import 'package:lecture_app/features/presentation/screens/UploadedFilles/UploadedFiles.dart';
import 'package:lecture_app/features/presentation/screens/upload%20content/Upload_files.dart';
import 'package:lecture_app/features/presentation/screens/aboutApp/about_app.dart';
import 'package:lecture_app/features/presentation/screens/account_page/information_screen.dart';
import 'package:lecture_app/features/presentation/screens/nav_bottom_screens/nav_home.dart';
import 'package:lecture_app/features/presentation/widget/settins_tile.dart';
import 'package:toggle_switch/toggle_switch.dart';


class SettingsScreen extends StatefulWidget {
  static final ROUTE='Setting';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
List<Widget> item= [

];
  bool lang=true;
  MyLocaleController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Text(
            'Settings'.tr,
            style: TextStyle(fontSize: 30, fontFamily: AppStrings.constantFont),
          ),
        ]),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageAssets.background_Setting),
          fit: BoxFit.cover  ,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                SettingsTile(
                  color: AppColors.primary,
                  icon: Icons.house_outlined,
                  title: "Home".tr,
                  onTap: ()=>Navigator.pushNamedAndRemoveUntil(context,NavHome.ROUTE,(route)=>false),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30,
                  endIndent: 4,
                ),
                SettingsTile(
                  color: AppColors.primary,
                  icon: Icons.cloud_upload_outlined,
                  title: "Uploaded files".tr,
                  onTap: ()=>Navigator.pushNamed(context,Uploadedfiles.ROUTE),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30,
                  endIndent: 4,
                ),
                SettingsTile(
                  color: AppColors.primary,
                  icon: Icons.add_alert_sharp,
                  title: "Notification".tr,
                  onTap: (){},
                ),
                Divider(
                  color: Colors.grey,
                  height: 30,
                  endIndent: 4,
                ),
                SettingsTile(
                  color: AppColors.primary,
                  icon: Icons.question_mark_sharp,
                  title: "About App".tr,
                  onTap: ()=>Navigator.pushNamed(context,AboutApp.ROUTE),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
