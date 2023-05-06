
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/record%20lecture/Record_page.dart';

class RecordPage extends StatefulWidget {
  static final ROUTE='Recordpage';
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _record_pageState();
}

class _record_pageState extends State<RecordPage> {
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
        backgroundColor:AppColors.primary,
      ),
      body: Container(


        child: Column(
          children:
          [
            Image(image:AssetImage( ImageAssets.RecordPage),),
            SizedBox(
              height: 30,
            ),
            InkWell(child:Image.asset(
              ImageAssets.startRecord,
              scale: 2.5,
            )
              ,onTap: (){
                bool play=true;
                Navigator.pushNamed(context,record.ROUTE);
              },)
            ,
            SizedBox(
              height: 10,
            ),
            Text('Start'.tr,style: TextStyle(
                fontSize: 25,color: AppColors.primary,
                fontFamily: AppStrings.primaryFont
            ),
            )

          ],

        ),
      ),
    );
  }
}
