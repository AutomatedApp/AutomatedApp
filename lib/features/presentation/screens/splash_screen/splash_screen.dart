import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/HomePage.dart';
import 'package:lecture_app/features/presentation/screens/nav_bottom_screens/nav_home.dart';
import 'package:lecture_app/core/utils/network/local_network.dart';

import '../login_screen/login_screen.dart';
class SplshScreen extends StatefulWidget {
  static final ROUTE='splashScreen';
  const SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}
 var  token= cashNetwork.getCashData(key: "token");
class _SplshScreenState extends State<SplshScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacementNamed(
                context, cashNetwork.getCashData(key: "token")!=''? NavHome.ROUTE:LoginScreen.ROUTE)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF006782),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(ImageAssets.logo,
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('To Automate Your Lecture',
              style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily:  AppStrings.constantFont,
                  fontSize: 18
              ),
            ),
            Text('JUST CLICK!',
              style: TextStyle(
                fontFamily:  AppStrings.sego,
                  color: Color(0xFF893612),
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            SizedBox(
              height: 80,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
