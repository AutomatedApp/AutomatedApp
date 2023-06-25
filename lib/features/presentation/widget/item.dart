
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/HomePage.dart';

Widget defaultbtn(
{
  Function? onpressed,
  required String label,
  double? fontsize,
  String? fontFamily,
  Color? fontColor,
  Color? backgroundColor,
  double? width,
  double? height,
})
=>MaterialButton(
minWidth: width?? double.infinity,
height: height?? 50,
color: backgroundColor?? AppColors.primary,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20)),
onPressed:onpressed!(),
child: Text(
label,
style: TextStyle(
fontFamily: fontFamily?? AppStrings.primaryFont,
color: fontColor?? Colors.white,
fontSize: fontsize?? 20,
fontWeight: FontWeight.bold),
),
);

Widget cards({
  BuildContext? context,
  String? pushNamed,
  String? icon_path,
  String? text,
    }
    )=> GestureDetector(
  onTap: ()=>Navigator.pushNamed(context!,pushNamed!),
  child:   Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),

      color: AppColors.homePage,
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
          image:  AssetImage(icon_path!),
          height: 60,
        ),
        Text(text!.tr,
          style: TextStyle(fontSize: 20, fontFamily:AppStrings.primaryFont),
        ),

      ],
    ),
  ),
);