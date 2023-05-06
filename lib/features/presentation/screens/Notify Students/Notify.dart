import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/constant.dart';


class notify extends StatelessWidget
{
  static final ROUTE='Notify';
  const notify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refdb = FirebaseDatabase.instance.ref();
    var notify=TextEditingController();
    return Scaffold(


      appBar: AppBar(
        title: Row(

          children: [


            Text(
              'Notify Students'.tr,
              style: TextStyle(color: Colors.white,
                  fontSize: 30), //<-- SEE HERE
            ),

          ],
        ),
        backgroundColor:AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children:
          [
            Expanded(child: Image(image:AssetImage( ImageAssets.background),)),
            Expanded(
              flex: 2,
                child: SingleChildScrollView(
                  child: Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0,left: 30,bottom: 30),
                    child: Container(
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.withOpacity(.4)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Row(
                                      children: [Icon(Icons.notifications_on_outlined,color: AppColors.primary,size: 40,),
                                        SizedBox(width: 10,)
                                        ,Text('Notify Students'.tr,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.primary),),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('Do you have a sudden emergancy?'.tr),
                                Text('Dont worry ,Now you can notify your students'.tr),
                                SizedBox(height: 10,),

                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: notify,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    decoration: InputDecoration(
                                      //enabledBorder: InputBorder.none,
                                      filled: true, //<-- SEE HERE
                                      fillColor: Colors.grey.withOpacity(.3),
                                      border: OutlineInputBorder(

                                          borderRadius: BorderRadius.circular(20),
                                          gapPadding: 20
                                      ),
                                      hintText: "What news you want to share?".tr,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),



                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        constants.SnacMessage(context, "Message has sent");
                        refdb.child("notify").child("message").set(notify.text).asStream();
                        refdb.child("notify").child("flag").set(true).asStream();
                        notify.clear();
                      },

                      style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(Size(220, 50)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),

                            ),

                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary)),

                      child:Text('Send'.tr,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
              ],
            ),
                ))
          ],

        ),
      ),
    );
  }
}