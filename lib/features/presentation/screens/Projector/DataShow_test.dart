
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/core/utils/constant.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class DataShow extends StatefulWidget {
  static final ROUTE='DataShow';
  const DataShow({Key? key}) : super(key: key);

  @override
  State<DataShow> createState() => _DataShowState();
}


class _DataShowState extends State<DataShow> {
  final Uri sms=Uri.parse("sms:+201157509337");
  final Uri call=Uri.parse("tel:+201157509337");
  Future<void> _launchURL(Uri l) async{
    if(!await launchUrl(l))
    {
      throw Exception('Could not launch $l');
    }
  }
  Future recive_logo() async {

  }
  @override
  Widget build(BuildContext context) {
    final refdb = FirebaseDatabase.instance.ref();
    return Scaffold(


      appBar: AppBar(
        title: Row(

          children: [

            Text(
              'Projector'.tr,
              style: TextStyle(color: Colors.white,
                  fontSize: AppStrings.app_header),
            ),

          ],
        ),
        backgroundColor:AppColors.primary ,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Lottie.asset("R/Animate.json",height: 300,width:300,fit: BoxFit.contain),
            ),
            SizedBox(
              height: 250,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: context.width*.79,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          refdb.child("DataShow").child("flag").set(true).asStream();
                          Future.delayed(Duration(seconds: 10), () async {

                            refdb.child("DataShow").child('logofound').onValue.listen((event)async{
                              var value = await event.snapshot.value;
                              if(value==true){
                                return constants.Dialog(context: context, Text:
                                Column(children: [
                                  Text('Projector is working',style: TextStyle(fontSize: 21,fontFamily: AppStrings.primaryFont)),
                                  Text('Successfully',style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),)
                                ],),
                                    image: ImageAssets.logo);
                              } if(value==false) {
                                return constants.Dialog(context: context, Text:   Column(children: [
                                  Text('Projector is not  working',style: TextStyle(fontSize: 21,fontFamily: AppStrings.primaryFont)),
                                  Text('Error!',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),)
                                ],), image: ImageAssets.logo);
                              }
                              // Display a message to the user here
                            });

                          });
                        },
                        child: Text(
                          'Check Now'.tr,
                          style: TextStyle(

                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.primaryFont,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: context.width*.79,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey,)
                      ),
                      child: Column(

                        children: [
                          Container(
                            width:double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFE3DFDF),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 46,vertical: 8),

                            child: Text(
                              'Contact with technical man'.tr,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppStrings.primaryFont,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    _launchURL(sms);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4267B2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(FontAwesomeIcons.commentSms,color: Colors.white,size: 25,),
                                  ),
                                ),
                                SizedBox(width: 30),
                                InkWell(
                                  onTap: (){
                                    _launchURL(call);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1306C),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(FontAwesomeIcons.phone,color: Colors.white,size: 25,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
