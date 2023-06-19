import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';

class constants{
  var formKey = GlobalKey<FormState>();
  static void ShowDialog({required BuildContext context,required String msg}){
    showDialog(context: context, builder: (context)=>
        AlertDialog(

          backgroundColor: AppColors.homePage,
          title: Text(msg),
          icon: Icon(Icons.gpp_good,size: 40),
        ));
  }
  static void Dialog({required BuildContext context,required String msg,required String image,Function? onpressed}){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
          backgroundColor: AppColors.homePage,
          shape:Border.symmetric() ,
          actions: [
            Center(child: Image(image:AssetImage( image),fit: BoxFit.cover,height: 140,)),
            SizedBox(height: 10,),
            Center(child: Text(msg)),
          ],

        ));
  }
  static void messageDialog({required BuildContext context,required String msg,required String path}){
    showDialog(context: context, builder: (context)=>
        AlertDialog(
          backgroundColor: AppColors.homePage,
          shape:Border.symmetric() ,
          actions: [
            SizedBox(height: 10,),
            Center(child: Text(msg,style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),)),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TextButton(onPressed: (){ Navigator.pop(
                context,
              );}, child: Text('Cansel',style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),)),
              TextButton(onPressed: (){
              }, child: Text('Ok',style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),))
            ],)
          ],

        ));
  }
  static void showToast({required String msg, Color? color, ToastGravity? gravity}){
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor:color?? AppColors.primary,
          gravity: gravity?? ToastGravity.BOTTOM
      );

      }
  static void SnacMessage(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300,
        action: SnackBarAction(
            label: "Undo ", onPressed: (){ }),
        behavior:SnackBarBehavior.floating ,
        backgroundColor:AppColors.primary,
        content: Container( height: 30,width: 30, margin:EdgeInsetsDirectional.only(bottom: 10),child: Center(child: Text('$message',style: TextStyle(fontSize: 20,fontFamily: 'Segoe Print'),))),
      ),
    );
  }
}
String? token;

