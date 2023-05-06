import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/features/presentation/screens/nav_bottom_screens/nav_home.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


class record extends StatefulWidget {
  static final ROUTE='video';
  const record( {Key? key}) : super(key: key);
  @override
  State<record> createState() => _recordState();
}

class _recordState extends State<record> {
  bool resume = false;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }
  final refdb = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Row(

          children: [

            Text(
              'Record'.tr,
              style: TextStyle(color: Colors.white,
                  fontSize: 30), //<-- SEE HERE
            ),
            const SizedBox(
              width: 4,
            ),

            Image.asset(
              ImageAssets.upperRecord,
              scale: 2.3,
            ),

          ],
        ),
        backgroundColor:AppColors.primary ,
      ),
      body: Container(


        child: Center(
          child: Column(


            children:[
              SizedBox(height: 150,),
              StreamBuilder<int>(

                  stream: _stopWatchTimer.rawTime,
                  initialData:  _stopWatchTimer.rawTime.value,
                  builder: (context, snapshot) {
                    final value = snapshot.data;
                    final displayTime = StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                    return Text(displayTime,
                      style: TextStyle(
                          fontSize: 40,
                          color:AppColors.primary,
                          fontWeight: FontWeight.bold
                      ),);
                  }
              ),
              SizedBox(height: 40,),
              Image.asset(ImageAssets.RecordinIcon,scale: 2.3,),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                      },
                      child: Icon(
                           Icons.play_circle,
                         color: AppColors.primary,
                          size: 90,

                      ),
                    ),
                    SizedBox(width: 100,),
                    GestureDetector(
                      onTap: (){
                        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    },
                      child: Icon(
                          Icons.check_circle,
                              color: AppColors.primary,
                              size: 90),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

