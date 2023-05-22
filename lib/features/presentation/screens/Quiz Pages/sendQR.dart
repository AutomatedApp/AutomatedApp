
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';

class send extends StatefulWidget {
  const send({Key? key}) : super(key: key);

  @override
  State<send> createState() => _testState();
}

class _testState extends State<send> {
  final refdb = FirebaseDatabase.instance.ref();
  var Qr=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(

                controller: Qr,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.0,
                    ),
                  ),
                  enabled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  hintText: 'Paste the link here',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  refdb.child("QRcode").child("send").set(Qr.text).asStream();
                  refdb.child("QRcode").child("flag").set(true).asStream();
                  Qr.clear();
                },
                child: Text(
                  'Send'.tr,
                  style: TextStyle(
                      fontFamily: AppStrings.primaryFont,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
      ),

    );
  }
}