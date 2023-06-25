import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
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
          backgroundColor: AppColors.Dialog,
          shape:Border.symmetric() ,
          actions: [
            Center(child: Image(image:AssetImage( image),fit: BoxFit.cover,height: 140,)),
            SizedBox(height: 10,),
            Center(child: Text(msg,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
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


  static void SelectFolder({required BuildContext context,required var name,required TextEditingController namecontroller,}){
    var formKey = GlobalKey<FormState>();
    showDialog(context: context, builder: (context)=>
        Form(
          key: formKey,
          child: AlertDialog(
            actions: [
              TextFormField(
                onChanged: (data){
                  name=data.trim();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name must not be empty'.tr;
                  }

                  return null;
                },
                keyboardType: TextInputType.name,
                controller: namecontroller,
                decoration: InputDecoration(
                  labelText: 'name'.tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
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

                    namecontroller.clear();
                    Navigator.pop(
                      context,
                    );
                  }, child: Text('Ok',style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),))
                ],)
            ],
            backgroundColor: AppColors.homePage,
            title: Text('put the name of folder that can upload your files inside it'),
            icon: Icon(Icons.file_copy,size: 40),
          ),
        ));
  }
}
String? token;

