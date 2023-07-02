import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lecture_app/core/utils/app_images.dart';

class AboutApp extends StatefulWidget {
  static final ROUTE='AboutApp';
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  final Uri face=Uri.parse("https://www.facebook.com/profile.php?id=100090394670627");
  final Uri insta=Uri.parse("https://www.instagram.com/automated_lecture_hall2023/?hl=en");
  Future<void> _launchURL(Uri l) async{
    if(!await launchUrl(l))
    {
      throw Exception('Could not launch $l');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'.tr,
          style: TextStyle(color: Colors.white,
              fontSize: AppStrings.app_header,
              fontFamily: AppStrings.primaryFont,
          ),
        ),
        // backgroundColor: AppColors.primary,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            CircularProgressIndicator();
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:50),
            child: Center(
              child: Image.asset(
                ImageAssets.logo,
                width: 200,
                height: 200,
                alignment: Alignment.center,
              ),
            ),
          ),
          SizedBox(height: 40,),
          Text('Automated Lecture Hall',

            style: TextStyle(
                fontSize: 20,
                fontFamily: AppStrings.primaryFont,
                fontWeight: FontWeight.bold,
                color: AppColors.primary
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                textAlign:TextAlign.center,
              'It is an application to improve and upgrade the quality of education and to make everything inside the lecture hall work automatically with just a few simple clicks and steps.',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: AppStrings.primaryFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                ),
              ),
            ),
          ),
          SizedBox(height: 180,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  _launchURL(face);
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
                  child: Icon(FontAwesomeIcons.facebook,color: Colors.white,size: 25,),
                ),
              ),
              InkWell(
                onTap: (){
                  _launchURL(insta);
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
                  child: Icon(FontAwesomeIcons.instagram,color: Colors.white,size: 25,),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          RichText(
            text: TextSpan(
              text: 'CopyRight',
              style: TextStyle(color: Colors.grey,fontSize: 18,
                fontFamily: AppStrings.constantFont,
                fontWeight: FontWeight.bold,), /*defining default style is optional */
              children: <TextSpan>[
                TextSpan(

                    text: ' © 2023 By Team Masterminds', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18,
                  fontFamily: AppStrings.constantFont,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
